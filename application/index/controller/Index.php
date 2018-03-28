<?php
namespace app\index\controller;
use think\Session;
use think\Loader;
class Index extends \think\Controller
{
    public function index()
    {
    	if(!Session::get('userInfo.Id')){
            return $this->error('请先登录',url('/index/index/login'));
        }
        return $this->fetch();
    }
    public function register()
    {
        if(request()->isPost()){
            $post = input('post.');
            $validate = Loader::validate('User');
            //验证
            if(!$validate->check($post)){
                return $this->error($validate->scene('register')->getError());
            }
            $imgVali = new \think\captcha\ Captcha();
            if(!$imgVali->check($post['imgVali'])){
                return $this->error('图形验证码错误');
            }
            $member = model('member');
            $isNull = $member->where("NickName = '$post[nickname]'")->field('Id')->find();
            if($isNull){
                return $this->error('用户已经存在');
            }
            $result = $member->where("TJtoken = '$post[tjtoken]'")->find();
            if($result['TJtoken'] !== $post['tjtoken']){
                return $this->error('邀请码错误');
            }
            $count = $member->where("Mobile = $post[phone]")->count();
            if($count === 10){
                return $this->error('手机已经注册10次了');
            }
            if($post['phoneCode'] != Session::get($post['phone'].'_smsVali')){
                return $this->error('短信验证码错误');
            }
            /*
                1、判断是否还有推荐位 如果有填入TJvalue 如果没有往下填入DJvalue
                isFull 0 有两个位子 1 左边位子被占（推荐位） 2 左边位子被占（节点位）3 两个位置都被占
            */
            /*//查询一级推荐人
            $tjhuman = $member->where("RegisterLevelId = 1 AND Ranks like %,$result[Id]%")->field('Ranks')->find();
            $tjhuman = explode(',', substr($tjhuman, 2));
            foreach ($tjhuman as $ $v) {
                
            }*/
            $update = [];
            $updateflag = 'TJLeftValue';
            $resultId = $result['Id'];
            $resultRanks = $result['Ranks'];
            switch ($result['IsFull']) {
                case 0:
                    $update["$updateflag"] = 0;
                    $update['IsFull'] = 1;
                    break;
                case 1:
                    $updateflag = 'TJRightValue';
                    $update["$updateflag"] = 0;
                    $update['IsFull'] = 3;
                    break;
                case 2:
                    $updateflag = 'TJRightValue';
                    $update["$updateflag"] = 0;
                    $update['IsFull'] = 3;
                    break;
                case 3:
                //向下滑

                    $ranks = explode(',',$result['Ranks']);
                    $arr = $member->where(['Id'=>['in',$ranks],'IsFull'=>['neq',3]])->find();
                    if(count($arr)){
                        if($arr['IsFull']==0){
                            $updateflag = 'JDLeftValue';
                            $update["$updateflag"] = 0;
                            $update['IsFull'] = 2;
                        }else{
                            $updateflag = 'JDRightValue';
                            $update["$updateflag"] = 0;
                            $update['IsFull'] = 3;
                        }
                    }
                    $resultId = $arr['Id'];
                    $resultRanks = $arr['Ranks'];
            }          
            // 生成邀请码
            $nToken = getToken();
            //注册
            $data['NickName'] = $post['nickname'];
            $data['L1Pwd'] = getMd5($post['pwd'],$nToken);
            //注册等级（推荐人下级与节点无关）
            $data['RegisterLevelId'] = $result['RegisterLevelId']+1;
            //推荐人 节点人
            $data['TJUserId'] = $result['Id'];
            $data['TJUserNickName'] = $result['NickName'];
            if($result['Id']!=$resultId){
                $data['JDUserId'] = $resultId;
                $data['JDUserNickName'] = $arr['NickName'];
            }
            $data['Mobile'] = $post['phone'];
            $data['TJtoken'] = $nToken;
            $data['Ranks'] = 0;
            //钱包地址
            $data['WalletAdress'] = md5($data['NickName'].$data['Mobile']);
            $flagid = $member->insertGetId($data);
            if(!$flagid){
                return $this->error('注册失败');
            }
            $update["$updateflag"] = $flagid;
            //更新上游数据
            $resultArr = $member->where("Ranks like '%,$resultId%'")->field('Id,Ranks')->select();
            foreach ($resultArr as $v) {
                $member->where("Id = $v[Id]")->update(['Ranks'=>$v['Ranks'].','.$flagid]);
            }
            //更新数据
            $update['Ranks'] = $resultRanks.','.$flagid;
            $flagUp = $member->where("Id = $resultId")->update($update);
            return $this->success('注册成功',url('/index/index/login'));
        }
        return $this->fetch();
    }
    //登录
    public function login()
    {
        $post = input('post.');
        if(!request()->isPost()&&count($post)!==3){
            return $this->fetch();
        }
        //验证
        $flag = valiCaptcha($post['captcha']);
        if(!$post['nickname']||!preg_match('/^\w{6,}$/',$post['pwd'])||!$flag){
            return $this->error('数据错误');
        }
        $member = model('member');
        $result = $member->where("NickName = $post[nickname]")->find();
        if(!$result){
            return $this->error('没有该用户');
        }
        if(md5($post['pwd'].$result['TJtoken'])!==$result['L1Pwd']){
            return $this->error('密码错误');
        }
        //登陆成功
        Session::set('userInfo',$result);
        return $this->success('登录成功',url('/'));
    }
    //退出
    public function loginOut()
    {
        Session::delete('userInfo');
        return $this->success('成功登出',url('/index/index/login'));
    }
    //二维码
    public function getQrcode()
    {
        getQrcodeImg('https://www.m.com'.url('/index/index/show','tj='.Session::get('userInfo.TJtoken')));
    }
    public function sendCode()
    {
    	$code = rand(1000,9999);
    	$p = '15283827970';
    	Session::set($p.'_smsVali',$code);
    	echo $code;
    }
}
