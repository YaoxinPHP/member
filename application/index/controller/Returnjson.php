<?php
namespace app\index\controller;
use think\Loader;
class Returnjson extends Common
{
    public function member()
    {
        $data['nickname'] = $this->userInfo['NickName'];
        $data['wallet'] = $this->getWallet();
        //智能算力
        $data['zn'] = $this->getZN();
        //节点算力
        $data['jd'] = $this->getJD();
        return $data;
    }
    //个人自资料
    public function memberInfo()
    {
        $data['TJtoken'] = $this->userInfo['TJtoken'];
        $data['Mobile'] = $this->userInfo['Mobile'];
        $data['WalletAdress'] = $this->userInfo['walletAdress'];
        return $data;
    }
    //算力记录
    public function memberSL()
    {
        if(!preg_match('/^[012]$/', input('type'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        return model('SlLog')->where("Type = ".input('type')."AND UserId = ".$this->UserId)->select();
    }
    //钱包地址展示
    public function wallet()
    {
        return ['walletAdress'=>$this->userInfo['WalletAdress']];
    }
    //Gas 兑换记录
    public function GasInfo()
    {
        return model('GasLog')->where("UserId = ".$this->UserId)->select();
    }
    //在线记录
    public function online()
    {
        if(!preg_match('/^[012]$/', input('type'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        $where['Type'] = input('type');
        $where['Way'] = 0;
        $where['Id'] = $this->UserId;
        return model('Detail')->where($where)->select();
    }
    //离线记录
    public function offline()
    {
        if(!preg_match('/^[012]$/', input('type'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        $where['Type'] = input('type');
        $where['Way'] = 1;
        $where['Id'] = $this->UserId;
        return model('Detail')->where($where)->select();
    }
    //新闻
    public function news()
    {
        return model('News')->select();
    }
    //留言记录
    public function message
    {
        return model('Mess')->where("UserId = ".$this->UserId)->select();
    }
    //退出
    public function loginOut()
    {
        Session::delete('userInfo');
        return $this->success('成功登出',url('/index/index/login'));
    }
    //兑换GAS
    public function tradeGas()
    {
        if(!preg_match('/^[012]$/', input('num'))){
            return ['status'=>201,'msg'=>'错误操作'];
        }
        $fcc = input('num');
        $gas = $fcc*100;
        //扣除增加
        $wallet = $this->wallet();
        $data['Amount'] = $wallet['Amount']-$fcc;
        $data['Gas'] = $wallet['Gas']+$gas;
        $flag = model('Wallet')->where("Id = ".$this->UserId)->update($data);
        return $flag?['status'=>200,'msg'='兑换成功']:['status'=>202,'msg'='兑换失败'];
    }
    //在线兑换
    public function tradeOnlone()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'='参数错误']
        }
        $validate = Loader::validate('User')->scene('register');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=$this->error($validate->getError()]);
        }
        if($this->userInfo['L2Pwd'] !== md5($post['pwd'].$this->userInfo['TJtoken'])){
            return ['status'=>202,'msg'='高级密码错误']);
        }
        $post = input('post.');
        $getId = model('Member')->where("WalletAdress = '$post[walletAdress]'")->field('Id')->find();
        if(!count($getId)){
            return ['status'=>202,'msg'='钱包地址错误']);
        }
        $fcc = model('Wallet')->where("Id = $getId")->field('Amount')->find();
        $fcc = $fcc['Amount']+$post['num'];
        $f = $this->wallet();
        $f = $f['Amount']-$post['num'];
        // 启动事务
        Db::startTrans();
        try{
            Db::table('wallet')->updata(['Amount'=>$fcc]);
            Db::table('wallet')->updata(['Amount'=>+$f]);
            // 提交事务
            Db::commit();    
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return ['status'=>202,'msg'='发送失败']);
        }
        return ['status'=>200,'msg'='发送成']);
    }
    //登录密码更改
    public function changeL1()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'='参数错误']
        }
        $validate = Loader::validate('User')->scene('updataPwd');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=$this->error($validate->getError()]);
        }
        $post = input('post.')
        $code = session($post['phone'].'_smsCode');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'='短信验证码错误'];
        }
        $pwd = md5($post['pwd'].$this->userInfo['TJtoken']);
        $flag = model('Member')->where("Id = ".$this->UserId)->update(['L1Pwd'=>$pwd]);
        return $flag?['status'=>200,'msg'='修改成功']:['status'=>202,'msg'='修改失败'];
    }
    //登录密码更改
    public function changeL2()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'='参数错误']
        }
        $validate = Loader::validate('User')->scene('updataPwd');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=$this->error($validate->getError()]);
        }
        $post = input('post.');
        $code = session($post['phone'].'_smsCode');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'='短信验证码错误'];
        }
        $pwd = md5($post['pwd'].$this->userInfo['TJtoken']);
        $flag = model('Member')->where("Id = ".$this->UserId)->update(['L2Pwd'=>$pwd]);
        return $flag?['status'=>200,'msg'='修改成功']:['status'=>202,'msg'='修改失败'];
    }
    //修改手机号码
    public function changePhone()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'='参数错误']
        }
        $validate = Loader::validate('User')->scene('updataPhone');
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=$this->error($validate->getError()]);
        }
        $post = input('post.');
        $code = session($post['phone'].'_smsCode');
        if($post['phoneCode']!=$code){
            return ['status'=>203,'msg'='短信验证码错误'];
        }
        $flag = model('Member')->where("Id = ".$this->UserId)->update(['Mobile'=>$post['oldPhone']]);
        return $flag?['status'=>200,'msg'='修改成功']:['status'=>202,'msg'='修改失败'];
    }
    //留言
    public function takeMsg()
    {
        if(!request()->isPost()){
            return ['status'=>202,'msg'='参数错误']
        }
        $validate = Loader::validate('User'));
        //验证
        if(!$validate->check($post)){
            return ['status'=>202,'msg'=$this->error($validate->getError()]);
        }
        $post = input('post.');
        $flag = model('Mess')->save($post);
        return $flag?['status'=>200,'msg'='留言成功']:['status'=>202,'msg'='留言失败'];
    }
}
