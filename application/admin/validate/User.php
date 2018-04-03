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
		'Title' => 'require',
		'Content' => 'require',
		'Type' => 'require|/^\d{1,}$/',
	];
	protected $message = [
		'NickName.require' => '昵称不能为空',
		'L1Pwd' 		   => '密码至少6位',
		'RePwd'			   => '两次密码不相同',
		'Mobile'		   => '手机格式错误',
		'JiHuoMemberType'		   => '激活状态错误',
		'Id'		   => '错误参数',
		'Title' => '标题不能为空',
		'Content' => '内容不能为空',
		'Type' => '错误类型',
	];
	protected $scene = [
		'register' => ['NickName','L1Pwd','RePwd','Mobile','JiHuoMemberType'],
		'edit' => ['NickName','L1Pwd','RePwd','Mobile','JiHuoMemberType','Id'],
		'news' => ['Title','Content','Type'],
		'editNews' => ['Id','Title','Content','Type'],
	];
}