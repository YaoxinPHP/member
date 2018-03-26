<?php
namespace app\admin\controller;
/**
* 会员管理
*/
class Member extends Common
{
	
	public function index()
	{
		$res = db('user')->paginate(2);
        $this->assign('lists', $res);
		return $this->fetch();
	}
}