<?php
namespace app\index\validate;
use think\Validate;
/**
* 验证类
*/
class User extends Validate
{
	protected $rule = [
		'nickname' => 'require',
		'pwd'    => 'require|/^\w{6,}$/',
		'repwd'	   => 'require|confirm:pwd',
		'phone'   =>  'require|/^1[34578]\d{9}$/',
		'oldPhone'   =>  'require|/^1[34578]\d{9}$/',
		'phoneCode' => 'require|between:1000,9999',
		'walletAdress' => 'require|/^[a-z0-9]{32}$/',
		'num' => 'require|/^\d*$/',
	];
	protected $message = [
		'nickname.require' => '昵称不能为空',
		'pwd' 		   => '密码至少6位',
		'repwd'			   => '两次密码不相同',
		'phone'		   => '手机格式错误',
		'oldPhone'		   => '手机格式错误',
		'phoneCode'		   => '短信验证码错误',
		'walletAdress'		   => '钱包地址错误',
		'num'		   => '数量错误',
	];
	protected $scene = [
		'register' => ['nickname','pwd','repwd','phone','phoneCode'],
		'online' => ['walletAdress','pwd','num','phoneCode'],
		'updatePwd' => ['pwd','repwd','phoneCode'],
		'updatePhone' => ['phone','phoneCode'],
	];
}