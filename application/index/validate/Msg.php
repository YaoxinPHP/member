<?php
namespace app\index\validate;
use think\Validate;
/**
* 验证类
*/
class Msg extends Validate
{
	protected $rule = [
		'title' => 'require',
		'phone'   =>  'require|/^1[34578]\d{9}$/',
		'type'   =>  'require|/^\d*$/',
		'content'   =>  'require',
		'id' => 'require|/^\d{1,}$/',
	];
	protected $message = [
		'title' => '标题不能为空',
		'phone'   =>  '手机格式错误',
		'type'   =>  '类型错误',
		'content'   =>  '内容不能为空',
		'id' => '错误操作',
	];
	protected $scene = [
		'msg' =>['title','phone','type','content'],
		'reply' =>['id','content'],
	];
}