<?php

/**
 *  
 * @file   GroupController
 */

namespace app\admin\controller;
use think\Loader;
class Notice extends Common 
{
	public function message()
	{
		$lists = model('Mess')->paginate(10);
		$this->assign('lists',$lists);
		return $this->fetch();
	}
	public function news()
	{
		$lists = model('News')->paginate(10);
		$this->assign('lists',$lists);
		return $this->fetch();
	}
	public function editNew()
	{
		if(request()->isPost()){
			$data = input('post.');
			$validate = Loader::validate('User')->scene('editNews');
			if(!$validate->check($data)){
				$this->error($validate->geterror());
			}
			$data['LastModifyDate'] = time();
	        $res = model('News')->where("Id = $data[Id]")->update($data);
	        if ($res) {
	            $this->success('操作成功', url('news'));
	        } else {
	            $this->error('操作失败');
	        }
		}
		if(input('id')<0){
			$this->error('错误操作');
		}
		$info = model('News')->where("Id = ".input('id'))->find();
		$this->assign('info',$info);
		$this->assign('url',url('editNew'));
		return $this->fetch('addNew');
	}
	public function addNew()
	{
		if(request()->isPost()){
			$data = input('post.');
			$validate = Loader::validate('User')->scene('news');
			if(!$validate->check($data)){
				$this->error($validate->geterror());
			}
			$data['CreateDate'] = time();
	        $res = model('News')->save($data);
	        if ($res) {
	            $this->success('操作成功', url('news'));
	        } else {
	            $this->error('操作失败');
	        }
		}
		$this->assign('url',url(''));
		return $this->fetch();
		
	}
	public function delNew()
	{
		$id = input('id');
		if($id<0){
			$this->error('错误操作');
		}
        $res = model('News')->where(['Id' => $id])->delete();
        if ($res) {
            $this->success('操作成功', url('news'));
        } else {
            $this->error('操作失败');
        }
	}
	public function reply()
	{
		if(request()->isPost()){
			$post = input('post.');
			if(!preg_match('/^\d{1,}$/', $post['Id']))
			{
				$this->error('错误操作');
			}
			$data['MessId'] = $post['Id'];
	        $data['UserId'] = $this->user_id;
	        $data['NickName'] = '管理员';
	        $data['Content'] = $post['Content'];
	        $data['AddTime'] = time();
	        $flag = model('Msg')->save($data);        
	        $flag?$this->success('留言成功'):$this->error('留言失败');
		}
		if(!preg_match('/^\d{1,}$/', input('id'))){
            return $this->error('错误操作');
        }
        $info = model('Msg')->where('MessId = '.input('id'))->select();
		$this->assign('info',$info);
		return $this->fetch();
	}
}