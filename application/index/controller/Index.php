<?php
namespace app\index\controller;
use think\Cache;
class Index extends \think\Controller
{
    public function index()
    {
    	if(request()->isPost()){
    		$post = input('post.');
    		$member = model('member');
    		$result = $member->where("TJtoken = $post[tjtoken]")->find();
    		//验证
    		/*if(!$post['nickname']){
    			return $this->error('昵称不能为空');
    		}
    		if(!preg_match('/^\w{6,}$/', $post['pwd'])){
    			return $this->error('密码至少6位');
    		}
    		if($post['pwd'] !== $post['repwd']){
    			return $this->error('两次密码不相同');
    		}
    		if(!$post['tjtoken']){
    			return $this->error('邀请码不能为空');
    		}else{
    			$result = $member->where("TJtoken = $post[token]")->field('TJtoken')->find();
    			if($result['tjtoken'] !== $post['tjtoken']){
    				return $this->error('邀请码错误');
    			}
    		}
    		if(!$post['imgvali']){
				return $this->error('图形验证不能为空');
    		}else{
    			$imgVali = new \think\captcha\ Captcha();
    			if(!$imgVali->check($post['imgVali'])){
	    			return $this->error('图形验证码错误');
	    		}
    		}
    		if(preg_match('/^1[3|4|5|7|8]\d{9}$/', $post['phone'])){
				return $this->error('手机格式错误');
    		}else{
    			$count = $member->where("Mobile = $post[phone]")->count();
    			if($count === 10){
					return $this->error('手机已经注册10次了');
    			}
    		}
    		if($post['phoneCode'] != Cache::get($post['phone'].'_smsVali')){
    			return $this->error('短信验证码错误');
    		}*/
    		//生成邀请码
   //  		$nToken = getToken();
   //  		//注册
   //  		$data['NickName'] = $post['nickname'];
   //  		$data['L1Pwd'] = getMd5($post['pwd'],$nToken);
   //  		$data['Mobile'] = $post['phone'];
   //  		$data['TJtoken'] = $nToken;
   //  		$flag = $member->save($data);
   //  		/*
			// 	1、判断是否还有推荐位 如果有填入TJvalue 如果没有往下填入DJvalue
			// 	isFull 0 有两个位子 1 左边位子被占（推荐位） 2 左边位子被占（节点位）3 两个位置都被占
   //  		*/
			// $update = [];
			// switch ($result['IsFull']) {
			// 	case 0:
			// 		$update['TJLeftValue'] = $flag;
			// 		$update['IsFull'] = 1;
			// 		break;
			// 	case 1:
			// 		$update['TJRightValue'] = $flag;
			// 		$update['IsFull'] = 3;
			// 		break;
			// 	case 3:
			// 		$ranks = explode(',',$result['Ranks']);
			// 		$arr = $member->where('Id','in',$ranks)->select();
			// }
			// $update['Ranks'] = $result['Ranks'].','.$flag;
			$ranks = explode(',',$result['Ranks']);
			$arr = $member->where('Id','in',$ranks)->select();
			foreach ($arr as $key => $value) {
				print_r($value);
			}
    	}
    	return $this->fetch();
    }
    public function sendCode()
    {
    	$code = rand(0,9999);
    	$p = '15283827970';
    	Cache::set($p.'_smsVali',$code);
    	var_dump(Cache::get($p));
    	echo $code;
    }
}
