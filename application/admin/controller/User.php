<?php
namespace app\admin\controller;
/**
* 网络管理
*/
class User extends Common{
	public function jdvtree()
	{
		$where = [];
		if(input('id')>0){
			$where['Id'] = input('id');
		}
		$res = db('user')->field('Id,NickName,Mobile,TJLeftValue,TJRightValue,JDLeftValue,JDRightValue,RegisterLevelId,RegisterDate,JiHuoMemberType')->where($where)->find();
		$team = $this->team($res);
		$data = $this->getTeam($team);
		$list['name'] = '<a href="jdvtree/id/'.$res['Id'].'">'.$res['Mobile'].'['.$res['NickName'].']</a>';
		$res['JiHuoMemberType'] = ($res['JiHuoMemberType']==0)?'未激活':'激活';
		$list['title'] = '<table><tbody><tr><td colspan="3">会员</td></tr><tr><td></td><td>链接一</td><td>链接二</td></tr><tr><td>业绩</td><td>0</td><td>0</td></tr><tr><td colspan="2">'.$res['RegisterDate'].'</td><td>'.$res['JiHuoMemberType'].'</td></tr></tbody></table>';
		$list['children'] = $data;
		$this->assign('list',json_encode($list));
		$this->assign('where',$where);
		$this->assign('user',db('user')->field('Id,NickName')->where('RegisterLevelId = 1')->select());
		return $this->fetch();
	}
	//公排树状图
	public function jdtree()
	{
		if(request()->isPost()&&input('post.id')>0){
			$res = $this->getSingleTeam(input('post.id'));
			echo ($res[0])?json_encode($res):0;
		}else{			
			$where =(input('id')>0)?['Id'=>input('id')]:['RegisterLevelId'=>1];
			$this->assign('user',db('user')->field('Id,NickName,Mobile,Ranks')->where($where)->select());
			return $this->fetch();
		}
	}
	//推荐网络图
	public function tjvtree()
	{
		$id = (input('id')>0)?input('id'):1;
		$where['TJUserId'] = $id;
		$ress = db('user')->field('Id,NickName,Mobile,RegisterDate,JiHuoMemberType')->where($where)->select();
		$res = db('user')->field('Id,NickName,Mobile,RegisterDate,JiHuoMemberType')->where("Id = '$id'")->find();
		$data = $this->getTjTeam($ress);
		$list['name'] = '<a href="tjvtree/id/'.$res['Id'].'">'.$res['Mobile'].'['.$res['NickName'].']</a>';
		$res['JiHuoMemberType'] = ($res['JiHuoMemberType']==0)?'未激活':'激活';
		$list['title'] = '<table><tbody><tr><td colspan="3">会员</td></tr><tr><td></td><td>链接一</td><td>链接二</td></tr><tr><td>业绩</td><td>0</td><td>0</td></tr><tr><td colspan="2">'.$res['RegisterDate'].'</td><td>'.$res['JiHuoMemberType'].'</td></tr></tbody></table>';
		$list['children'] = $data;
		// p($list);
		$this->assign('list',json_encode($list));
		$this->assign('user',db('user')->field('Id,NickName')->where('RegisterLevelId = 1')->select());
		return $this->fetch();
	}
	//推荐树状图
	public function tjtree()
	{
		if(request()->isPost()&&input('post.id')>0){
			$res = $res = db('user')->where("TJUserId = ".input('post.id'))->field('Id,NickName,Mobile,RegisterDate,JiHuoMemberType')->select();
			echo ($res[0])?json_encode($res):0;
		}else{			
			$where =(input('id')>0)?['Id'=>input('id')]:['RegisterLevelId'=>1];
			$this->assign('user',db('user')->field('Id,NickName,Mobile,Ranks')->where($where)->select());
			return $this->fetch();
		}
	}
	private function team($res)
	{
		$data[0] = (!$res['TJLeftValue'])?$res['JDLeftValue']:$res['TJLeftValue'];
		$data[1] = (!$res['TJRightValue'])?$res['JDRightValue']:$res['TJRightValue'];
		return $data;
	}
	private function getTeam($team)
	{		
		foreach ($team as $k => $v) {
			$data = db('user')->where("Id = '$v'")->field('Id,NickName,Mobile,TJLeftValue,TJRightValue,JDLeftValue,JDRightValue,RegisterLevelId,RegisterDate,JiHuoMemberType')->find();
			if(!$data){
				break;
			}
			$data['JiHuoMemberType'] = ($data['JiHuoMemberType']==0)?'未激活':'激活';
			$list = [
				'name' => '<a href="jdvtree/id/'.$data['Id'].'">'.$data['Mobile'].'['.$data['NickName'].']</a>',
				'title' => '<table><tbody><tr><td colspan="3">会员</td></tr><tr><td></td><td>链接一</td><td>链接二</td></tr><tr><td>业绩</td><td>0</td><td>0</td></tr><tr><td colspan="2">'.$data['RegisterDate'].'</td><td>'.$data['JiHuoMemberType'].'</td></tr></tbody></table>'
			];
			$arr[$k] = $list;
			$arr[$k]['children'] = $this->team($data);
			$arr[$k]['children'] = $this->getTeam($arr[$k]['children']);	
		}
		return $arr;
	}
	private function getSingleTeam($id)
	{
		$res = db('user')->where("Id = '$id'")->field('Id,NickName,Mobile,TJLeftValue,TJRightValue,JDLeftValue,JDRightValue,RegisterLevelId,RegisterDate,JiHuoMemberType')->find();
		$res['team'] = $this->team($res);
		foreach ($res['team'] as $k => $v) {
			$data = db('user')->where("Id = '$v'")->field('Id,NickName,Mobile,TJLeftValue,TJRightValue,JDLeftValue,JDRightValue,RegisterLevelId,RegisterDate,JiHuoMemberType,Ranks')->find();
			$arr[] = $data;
		}
		return $arr;
	}
	private function getTjTeam($res)
	{
		foreach ($res as $k => $v) {
			$data = db('user')->where("TJUserId = '$v[Id]'")->field('Id,NickName,Mobile,RegisterDate,JiHuoMemberType')->select();
			/*if(count($data)<=0){
			}*/
			$v['JiHuoMemberType'] = ($v['JiHuoMemberType']==0)?'未激活':'激活';
			$rdata = [
				'name' => '<a href="tjvtree/id/'.$v['Id'].'">'.$v['Mobile'].'['.$v['NickName'].']</a>',
				'title' => '<table><tbody><tr><td colspan="3">会员</td></tr><tr><td></td><td>链接一</td><td>链接二</td></tr><tr><td>业绩</td><td>0</td><td>0</td></tr><tr><td colspan="2">'.$v['RegisterDate'].'</td><td>'.$v['JiHuoMemberType'].'</td></tr></tbody></table>'
			];
			$arr[$k] = $rdata;
			$arr[$k]['children'] = $this->getTjTeam($data);
		}
		return $arr;
	}
}