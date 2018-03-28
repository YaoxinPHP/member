<?php
namespace app\admin\controller;
/**
* 奖金管理
*/
class Bonus extends Common
{
	public function setting()
	{
		if(count(input('post.')))
		{
			if(!preg_match('/^[012]$/', input('type')))
			{
				 $this->error('错误参数');
			}
			$post = input('post.');
			$type = input('type');
			switch ($type) {
				case 0 OR 1:
					foreach ($post['setting'] as $k => $v) {
						$arr[$k]['Id'] = $k;
						foreach ($v as $kk=> $vv) {
							$arr[$k][$kk] = $vv;
						}
					}							
					$flag = model('BonusSet')->isUpdate()->saveAll($arr);
					break;
				case 2:
					foreach ($post['para'] as $k => $v) {
						$arr[$k]['Id'] = $k+1;
						foreach ($v as $kk=> $vv) {
							$arr[$k][$kk] = $vv;
						}
					}
					$flag = model('BonusPara')->isUpdate()->saveAll($arr);
					break;	
			}			
			return ($flag)?$this->success('操作成功'):$this->error('操作失败');
		}
		$para = db('bonus_parameter')->select();
		$setting = db('bonus_setting')->select();
		$this->assign('para',$para);
		$this->assign('setting',$setting);
		return $this->fetch();
	}
	public function add()
	{
		if(request()->isPost())
		{
			$post = input('post.');
			$flag = db('bonus_setting')->insert($post);
			return ($flag)?$this->success('操作成功'):$this->error('操作失败');
		}
		return $this->fetch();
	}
}