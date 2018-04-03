<?php
namespace app\index\controller;
use think\Loader;
use think\Session;
class Login extends \think\Controller
{
    public function register()
    {
        if(request()->isPost()){
            $post = input('post.');
            $validate = Loader::validate('User')->scene('register');
            //验证
            if(!$validate->check($post)){
                return ['status'=>201,'msg'=>$validate->getError()];
            }
            if(!valiCaptcha($post['imgVali'])){
                return ['status'=>201,'msg'=>'图形验证码错误'];
            }
            $member = model('Member');
            $isNull = $member->where("NickName = '$post[nickname]'")->field('Id')->find();
            if($isNull){
                return ['status'=>201,'msg'=>'用户已经存在'];
            }
            $result = $member->where("TJtoken = '$post[tjtoken]'")->find();
            if($result['TJtoken'] !== $post['tjtoken']){
                return ['status'=>201,'msg'=>'邀请码错误'];
            }
            $count = $member->where("Mobile = $post[phone]")->count();
            if($count === 10){
                return ['status'=>201,'msg'=>'手机已经注册10次了'];
            }
            if($post['phoneCode'] != Session::get($post['phone'].'_smsVali')){
                return ['status'=>201,'msg'=>'短信验证码错误'];
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
            $resultJTRanks = $result['JTRanks'];
            $resultTime = $result['RanksTime'];
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
                    $resultJTRanks = $arr['JTRanks'];
                    $resultTime = $arr['RanksTime'];
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
            $data['JTRanks'] = 0;
            $data['RanksTime'] = time();
            //钱包地址
            $data['WalletAdress'] = md5($data['NickName'].$data['Mobile']);
            $flagid = $member->insertGetId($data);
            if(!$flagid){
                return ['status'=>202,'msg'=>'注册失败'];
            }
            //添加钱包
            model('Wallet')->insert(['UserId'=>$flagid,'UpdateTime'=>time()]);
            $update["$updateflag"] = $flagid;
            //更新上游数据
            $resultArr = $member->where("Ranks like '%,$resultId%'")->field('Id,Ranks,RanksTime')->select();
            foreach ($resultArr as $v) {
                //今日增加团队
                $Ranksdata = ['Ranks'=>$v['Ranks'].','.$flagid];
                $Ranksdata['JTRanks'] = (date('Ymd',$v['RanksTime'])==date('Ymd'))?$v['JTRanks'].','.$flagid:$flagid;
                $Ranksdata['RanksTime'] = time();
                $member->where("Id = $v[Id]")->update($Ranksdata);

            }
            //更新数据
            $update['Ranks'] = $resultRanks.','.$flagid;
            $update['JTRanks'] = (date('Ymd',$resultTime)==date('Ymd'))?$resultJTRanks.','.$flagid:$flagid;
            $update['RanksTime'] = time();
            $flagUp = $member->where("Id = $resultId")->update($update);
            return ['status'=>200,'msg'=>'注册成功','url'=>'/wap/login.html'];
            return $this->success('',url('/index/index/login'));
        }
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
            return ['status'=>202,'msg'=>'错误数据'];
        }
        $member = model('member');
        $result = $member->where("NickName = '$post[nickname]'")->find();
        if(!$result){
            return ['status'=>202,'msg'=>'没有该用户'];
        }
        if(md5($post['pwd'].$result['TJtoken'])!==$result['L1Pwd']){
            return ['status'=>202,'msg'=>'密码错误'];
        }
        //登陆成功
        Session::set('userInfo',$result);
        return ['status'=>200,'msg'=>'登录成功','url'=>'/wap/index.html'];;
    }

    //二维码
    public function getQrcode()
    {
        $url = (input('type')==1)?url('/index/login/register','tj='.Session::get('userInfo.TJtoken')):url('/wap/online','wallet='.Session::get('userInfo.WalletAdress'));
        getQrcodeImg('https://www.m.com'.$url);
    }
    public function sendCode()
    {
        if(!preg_match('/^1[34578]\d{9}$/', input('phone'))){
            return ['status'=>201,'msg'=>'手机格式错误'];
        }
        $code = rand(1000,9999);
        $p = input('phone');
        Session::set($p.'_smsVali',$code);
        echo $code;
    }
}