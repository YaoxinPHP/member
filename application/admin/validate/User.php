<?php
namespace app\admin\validate;
use think\Validate;
/**
* 验证类
*/
class User extends Validate
{
	protected $rule = [
		'NickName' => 'require',
		'L1Pwd'    => 'require|/^\w{6,}$/',
		'RePwd'	   => 'require|confirm:L1Pwd',
		'Mobile'   =>  'require|/^1[34578]\d{9}$/',
		'JiHuoMemberType' => 'require|between:0,1',
		'Id' => '/^\d*$/',
	];
	protected $message = [
		'NickName.require' => '昵称不能为空',
		'L1Pwd' 		   => '密码至少6位',
		'RePwd'			   => '两次密码不相同',
		'Mobile'		   => '手机格式错误',
		'JiHuoMemberType'		   => '激活状态错误',
		'Id'		   => '错误参数',
	];
	protected $scene = [
		'register' => ['NickName','L1Pwd','RePwd','Mobile','JiHuoMemberType'],
		'edit' => ['NickName','L1Pwd','RePwd','Mobile','JiHuoMemberType','Id'],
	];
}