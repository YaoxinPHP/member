<?php
namespace app\index\controller;
use think\Loader;
use think\Db;
use think\Cache;
class Returnjson extends Common
{
    public function index()
    {
        return ['status'=>200,'msg'=>'ok'];
    }
    public function member()
    {
        $data['nickname'] = $this->userInfo['NickName'];
        $data['wallet'] = $this->userInfo['WalletAdress'];
        $data['token'] = $this->userInfo['TJtoken'];
        //智能算力
        $data['zn'] = $this->getZN();
        //节点算力
        $data['jd'] = $this->getJD();
        return $data;
    }
    //个人自资料
    public function memberInfo()
    {
        $data['Id'] = $this->userId;
        $data['TJtoken'] = $this->userInfo['TJtoken'];
        $data['Mobile'] = $this->userInfo['Mobile'];
        $data['WalletAdress'] = $this->userInfo['WalletAdress'];
        $data['Name'] = $this->userInfo['NickName'];
        return $data;
    }
    //算力记录
    public function memberSL()
    {
        if(!preg_match('/^[012]$/', input('type'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        return model('SlLog')->where("Type = ".input('type')." AND UserId = ".$this->userId)->order('Id DESC')->select();
    }
    //钱包地址展示
    public function wallet()
    {
        return ['walletAdress'=>$this->userInfo['WalletAdress']];
    }
    //Gas 兑换记录
    public function gas()
    {
        return model('GasLog')->where("UserId = ".$this->userId)->order('Id DESC')->select();
    }
    //在线记录
    public function online()
    {
        if(!preg_match('/^[012]$/', input('type'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        $where['Way'] = input('type');
        $where['UserId'] = $this->userId;
        return model('DetailOnline')->where($where)->order('Id DESC')->select();
    }
    //离线记录
    public function offline()
    {
        if(!preg_match('/^[012]$/', input('type'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        $where['Way'] = input('type');
        $where['UserId'] = $this->userId;
        return model('DetailOffline')->where($where)->order('Id DESC')->select();
    }
    //新闻
    public function news()
    {
        if(!preg_match('/^\d{1,}$/', input('id'))){
            return model('News')->field('Id,Title,CreateDate,Type')->select();
        }else{
            return model('News')->where("Id = ".input('id'))->select();
        }
    }
    //留言记录
    public function message()
    {
        return model('Mess')->where("UserId = ".$this->userId)->order('Id DESC')->select();
    }
    //留言详情
    public function messageInfo()
    {
        if(!preg_match('/^\d{1,}$/', input('id'))){
            return ['status'=>202,'msg'=>'错误操作'];
        }
        return model('Msg')->where("MessId = ".input('id'))->select();
    }
    //退出
    public function loginOut()
    {
        Cache::rm('userInfo');
        return ['status'=>200,'msg'=>'成功登出'];
    }
    //兑换GAS
    public function tradeGas()
    {
        if(!preg_match('/^\d{1,}$/', input('num'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        $fcc = input('num');
        $gas = $fcc*100;
        //扣除增加
        $wallet = $this->wallet;
        $data['Release'] = $wallet['Release']-$fcc;
        if($data['Release']<0){
            return ['status'=>202,'msg'=>'fcc不足'];
        }
        $data['Gas'] = $wallet['Gas']+$gas;
        $flag = model('Wallet')->where("UserId = ".$this->userId)->update($data);
        if($flag){
            $flag = model('GasLog')->save(['UserId'=>$this->userId,'NickName'=>$this->userInfo['NickName'],'Mobile'=>$this->userInfo['Mobile'],'Amount'=>$fcc,'AddTime'=>time(),'Type'=>0]);
            return $flag?['status'=>200,'msg'=>'兑换成功']:['status'=>202,'msg'=>'兑换失败'];
        }
        return ['status'=>202,'msg'=>'兑换失败'];
    }
    //在线兑换
    public function tradeOnline()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }
        $validate = Loader::validate('User')->scene('online');
        //验证
        $post = input('post.');
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        if(!valiCaptcha($post['captcha'])){
            return ['status'=>202,'msg'=>'图形验证码错误'];
        }        
        /*$code = Cache::get($this->userInfo['Mobile'].'_smsVali');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'=>'短信验证码错误'];
        }*/
        if($this->userInfo['L2Pwd'] !== md5($post['pwd'].$this->userInfo['TJtoken'])){
            return ['status'=>202,'msg'=>'高级密码错误'];
        }
        if($this->userInfo['WalletAdress'] === $post['walletAddress']){
            return ['status'=>202,'msg'=>'钱包地址不能是自己的'];
        }        
        $f = $this->wallet;
        $fgas = $f['Gas']-$post['num'];
        $f = $f['Release']-$post['num'];
        //消耗gas
        if($fgas<0){
            return ['status'=>202,'msg'=>'gas不足'];
        }
        if($f<0){
            return ['status'=>202,'msg'=>'fcc不足'];
        }
        $getId = model('Member')->where("WalletAdress = '$post[walletAddress]'")->field('Id,NickName,WalletAdress')->find();
        if(!count($getId)){
            return ['status'=>202,'msg'=>'钱包地址错误'];
        }
        $fcc = model('Wallet')->where("UserId = '$getId[Id]'")->field('Release')->find();
        $fcc = $fcc['Release']+$post['num'];
        // 启动事务
        Db::startTrans();
        try{
            //发送
            Db::table('t_wallet')->where("UserId = '$getId[Id]'")->update(['Release'=>$fcc,'UpdateTime'=>time()]);
            //记录
            $data = [
                'UserId' => $getId['Id'],
                'FromName' => $this->userInfo['NickName'],
                'ToName' => $getId['NickName'],
                'Amount' => $post['num'],
                'WalletAdress' => $post['walletAddress'],
                'ToWalletAdress' => $getId['WalletAdress'],
                'AddTime' => time(),
                'Way' => 1,
            ];
            Db::table('t_detail_online')->insert($data);
            //扣除
            Db::table('t_wallet')->where("UserId = ".$this->userId)->update(['Release'=>$f,'Gas'=>$fgas,'UpdateTime'=>time()]);    
            //记录
            $data = [
                'UserId' => $this->userId,
                'FromName' => $this->userInfo['NickName'],
                'ToName' => $getId['NickName'],
                'Amount' => $post['num'],
                'WalletAdress' => $this->userInfo['WalletAdress'],
                'ToWalletAdress' => $getId['WalletAdress'],
                'AddTime' => time(),
                'Way' => 0,
            ];
            Db::table('t_detail_online')->insert($data);
            Db::table('t_gas_log')->insert(['UserId'=>$this->userId,'NickName'=>$this->userInfo['NickName'],'UserId'=>$this->userInfo['Mobile'],'Amount'=>$post['num'],'AddTime'=>time(),'Type'=>1]);
            // 提交事务
            Db::commit();    
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return ['status'=>202,'msg'=>'发送失败'];
        }
        return ['status'=>200,'msg'=>'发送成功'];
    }
    //离线兑换
    public function tradeOffline()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }
        $validate = Loader::validate('User')->scene('online');
        //验证
        $post = input('post.');
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        if(!valiCaptcha($post['captcha'])){
            return ['status'=>202,'msg'=>'图形验证码错误'];
        }        
       /* $code = Cache::get($this->userInfo['Mobile'].'_smsVali');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'=>'短信验证码错误'];
        }*/
        if($this->userInfo['L2Pwd'] !== md5($post['pwd'].$this->userInfo['TJtoken'])){
            return ['status'=>202,'msg'=>'高级密码错误'];
        }
        if($this->userInfo['WalletAdress'] === $post['walletAddress']){
            return ['status'=>202,'msg'=>'钱包地址不能是自己的'];
        }        
        $f = $this->wallet;
        $f = $f['Release']-$post['num'];
        if($f<0){
            return ['status'=>202,'msg'=>'fcc不足'];
        }
        $getId = model('Member')->where("WalletAdress = '$post[walletAdress]'")->field('Id,NickName,WalletAdress')->find();
        if(!count($getId)){
            return ['status'=>202,'msg'=>'钱包地址错误'];
        }
        //离线接口。。
        $fcc = model('Wallet')->where("UserId = '$getId[Id]'")->field('Release')->find();
        $fcc = $fcc['Release']+$post['num'];
        // 启动事务
        Db::startTrans();
        try{
            //发送
            Db::table('t_wallet')->where("UserId = '$getId[Id]'")->update(['Release'=>$fcc,'UpdateTime'=>time()]);
            //记录
            $data = [
                'UserId' => $getId['Id'],
                'NickName' => $getId['NickName'],
                'Amount' => $post['num'],
                'WalletAdress' => $post['walletAddress'],
                'ToWalletAdress' => $getId['WalletAdress'],
                'AddTime' => time(),
                'Way' => 1,
            ];
            Db::table('t_detail_offline')->insert($data);
            //扣除
            Db::table('t_wallet')->where("UserId = ".$this->userId)->update(['Release'=>$f,'UpdateTime'=>time()]);  
            //记录
            $data = [
                'UserId' => $this->userId,
                'NickName' => $this->userInfo['NickName'],
                'Amount' => $post['num'],
                'WalletAdress' => $this->userInfo['WalletAdress'],
                'ToWalletAdress' => $getId['WalletAdress'],
                'AddTime' => time(),
                'Way' => 0,
            ];
            Db::table('t_detail_offline')->insert($data);
            Db::table('t_gas_log')->insert(['UserId'=>$this->userId,'NickName'=>$this->userInfo['NickName'],'UserId'=>$this->userInfo['Mobile'],'Amount'=>$post['num'],'AddTime'=>time(),'Type'=>1]);
            // 提交事务
            Db::commit();    
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return ['status'=>202,'msg'=>'发送失败'];
        }
        return ['status'=>200,'msg'=>'发送成功'];
    }
    //登录密码更改
    public function changeL1()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }
        $validate = Loader::validate('User')->scene('updatePwd');
        //验证
        $post = input('post.');
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        /*$code = Cache::get($this->userInfo['Mobile'].'_smsVali');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'=>'短信验证码错误'];
        }*/
        $pwd = md5($post['pwd'].$this->userInfo['TJtoken']);
        $flag = model('Member')->where("Id = ".$this->userId)->update(['L1Pwd'=>$pwd]);
        //更新
        $this->refresh();
        return $flag?['status'=>200,'msg'=>'修改成功']:['status'=>202,'msg'=>'修改失败'];
    }
    //登录密码更改
    public function changeL2()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }
        $validate = Loader::validate('User')->scene('updatePwd');
        $post = input('post.');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        /*$code = Cache::get($this->userInfo['Mobile'].'_smsVali');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'=>'短信验证码错误'];
        }*/
        $pwd = md5($post['pwd'].$this->userInfo['TJtoken']);
        $flag = model('Member')->where("Id = ".$this->userId)->update(['L2Pwd'=>"$pwd"]);
        //更新
        $this->refresh();
        return $flag?['status'=>200,'msg'=>'修改成功']:['status'=>202,'msg'=>'修改失败'];
    }
    //修改手机号码
    public function changePhone()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }
        $validate = Loader::validate('User');
        //验证
        $post = input('post.');
        if(!$validate->scene('updatePhone')->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        if(!valiCaptcha($post['captcha'])){
            return ['status'=>202,'msg'=>'图形验证码错误'];
        }
        /*$code = Cache::get($this->userInfo['Mobile'].'_smsVali');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'=>'短信验证码错误'];
        }*/
        $flag = model('Member')->where("Id = ".$this->userId)->update(['Mobile'=>$post['phone']]);
        //更新
        $this->refresh();
        return $flag?['status'=>200,'msg'=>'修改成功']:['status'=>202,'msg'=>'修改失败'];
    }
    //留言
    public function takeMsg()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }
        $post = input('post.');
        $validate = Loader::validate('Msg')->scene('msg');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        $data['Title'] = $post['title'];
        $data['UserId'] = $this->userId;
        $data['NickName'] = $this->userInfo['NickName'];
        $data['Type'] = $post['type'];
        $data['Mobile'] = $post['phone'];
        $data['AddTime'] = time();
        $flagid = model('Mess')->insertGetId($data);
        if(!$flagid){
            return ['status'=>202,'msg'=>'留言失败'];
        }
        $arr['MessId'] = $flagid;
        $arr['UserId'] = $data['UserId'];
        $arr['NickName'] = $data['NickName'];
        $arr['Content'] = $post['content'];
        $arr['AddTime'] = $data['AddTime'];
        $flag = model('Msg')->save($arr);        
        return $flag?['status'=>200,'msg'=>'留言成功']:['status'=>202,'msg'=>'留言失败'];
    }
    //回复Msg
    public function replyMsg()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'=>'参数错误'];
        }        
        $post = input('post.');
        $validate = Loader::validate('Msg')->scene('reply');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=>$validate->getError()];
        }
        $data['MessId'] = $post['id'];
        $data['UserId'] = $this->userId;
        $data['NickName'] = $this->userInfo['NickName'];
        $data['Content'] = $post['content'];
        $data['AddTime'] = time();
        $flag = model('Msg')->save($data);        
        return $flag?['status'=>200,'msg'=>'留言成功']:['status'=>202,'msg'=>'留言失败'];
    }
    //在线发送info
    public function onlineInfo()
    {
        $wallet = $this->wallet;
        $data['Release'] = $wallet['Release'];
        $data['WalletAdress'] = $this->userInfo['WalletAdress'];
        return $data;
    }
    //离线发送info
    public function offlineInfo()
    {
        $wallet = $this->wallet;
        $data['Release'] = $wallet['Release'];
        $data['WalletAdress'] = $this->userInfo['WalletAdress'];
        return $data;
    }
    //能量兑换
    public function gasInfo()
    {
        $data['release'] = $this->wallet['Release'];
        $data['fcc'] = $this->wallet['Amount'];
        return $data;
    }
    //发送验证码
    public function sendCode()
    {
        $code = rand(1000,9999);
        $p = input('phone');
        Cache::set($p.'_smsVali',$code);
        echo $code;
    }
    //左右链接参数
    public function getQrcode()
    {
        if(haveSeat($res)){
            $arr = findTJ($res);
            $tj = 'T_'.$arr['Id'];
        }else     
            $tj = 'T_left_'.input('id');
        $data['left'] = ['token'=>lock_url($tj),'investment'=>0.00];
        if(haveSeat($res,'right')){
            $arr = findTJ($res);
            $tj = 'T_'.$arr['Id'];
        }else     
            $tj = 'T_left_'.input('id');
        $data['right'] = ['token'=>lock_url($tj),'investment'=>0.00];;
        return $data;
    }
}
