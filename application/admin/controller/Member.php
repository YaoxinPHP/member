<?php
namespace app\admin\controller;
/**
* 会员管理
*/
class Member extends Common
{
	
	public function index()
	{
		$res = db('user')->order('Id desc')->paginate(10);
        $this->assign('lists', $res);
		return $this->fetch();
	}
	public function info()
	{
		return $this->fetch();
	}
	public function excleExport()
	{
		 $name='测试导出';
         $header=['表头A','表头B'];
	     $data=[

	       ['嘿嘿','heihei'],

	       ['哈哈','haha']

	     ];
        excelExport($name,$header,$data);

	}
}