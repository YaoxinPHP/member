<?php
namespace app\admin\controller;
/**
* 财务管理
*/
class Current extends Common
{
	//手工充值扣款
	public function operation()
	{
		$where = [];
		if(input('post.submit')){
			$where['a.Id'] = input('post.Id');
			unset($where['submit']);
		}
		$field = input('export')?'a.Id,a.NickName,a.TJUserNickName,a.JDUserNickName,a.RegisterDate,a.JiHuoMemberType,b.Amount,b.Release,a.WalletAdress':'a.*,b.Amount,b.Release';  
		$res = db('user')->alias('a')->join('__WALLET__ b','a.Id = b.UserId','left')->field($field)->where($where)->order('a.Id DESC')->paginate(10);
        $this->assign('lists', $res);
        $this->assign('where', input('post.'));
		return $this->fetch();
	}
	public function operationCurrent()
	{
		$post = input('post.');
		if(!preg_match('/^[0,1]{1}$/', input('post.type'))||!preg_match('/^\d{1,}$/', input('post.cid'))||input('post.amount')<=0||!preg_match('/^[0,1,2]{1}$/', input('post.current'))){
			$this->error('操作失败');
		}
		$md5 = db('admin')->where("Id = ".$this->user_id)->field('L1Pwd')->find();
		if(md5($post['pwd'])!==$md5['L1Pwd']){
			$this->error('密码错误');
		}
		$post = input('post.');
		switch ($post['current']) {
			case '0':
				$current = 'Amount';
				break;
			case '1':
				$current = 'Release';
				break;
			case '2':
				$current = 'Gas';
				break;
		}
		$flag = ($post['type']==0)?db('wallet')->where('UserId = '.$post['cid'])->setInc('Release',$post['amount']):db('wallet')->where('UserId = '.$post['cid'])->setDec($current,$post['amount']);
		$msg = ($post['type']==0)?'管理员充值'.$post['amount']:'管理员扣除'.$post['amount'];
		if($flag){
			/*$data = [
				'UserId' => $post['cid'],
				'Amount' => $post['amount'],
				'WalletAdress' => $msg,
				'AddTime' => time(),
				'Way' => 1,
				'Type' => 0,
			];
			db('detail')->insert($data);*/
			$data = [
				'UserId' => $post['cid'],
				'Amount' => $post['amount'],
				'Mobile' => $post['Mobile'],
				'Way'	 => $post['type'],
				'Type' => $post['current'],
				'AddTime' => time(),
				'Remarks' => $msg.'--'.$post['remarks'],
			];
			db('controller_current')->insert($data);
			$this->success('操纵成功',url('currentInfo'));
		}else{
			$this->erorr('操纵失败');
		}
	}
	//充值记录
	public function currentInfo()
	{
		$where = [];
		if(input('post.submit')){
			$where['Id'] = input('id');
			unset($data['a.submit']);
		}
		$res = db('controller_current')->where($where)->order('Id DESC')->paginate(10);
		if(input('export')){
			$name='手工充值扣款记录Excel表';
         	$header=['会员编号','会员电话','货币类型','金额','日期','备注','状态'];
         	foreach ($res as $k => $v) {
         		if($k == 'Type'){
         			switch ($v) {
						case '0':
							$v = 'Fcc';
							break;
						case '1':
							$v = '可转移资产';
							break;
						case '2':
							$v = 'Gas';
							break;
					}
         		}elseif($k=='AddTime'){
         			$v = date('Y-m-d H:s:i',$v);
         		}
         		$data[$k] = $v;
         		$data['status'] = '通过';
         	}
			return $this->excleExport($name,$header,$res);
		}
        $this->assign('lists', $res);
        $this->assign('where', $where);
		return $this->fetch();
	}
	//货币管理
	public function manager()
	{
		$where = [];
		if(request()->isPost()&&input('post.submit')&&input('post.UserId')>0){
			$where = input('post.');
			unset($where['submit']);
		}
		$wallet = db('wallet');
		$list = $wallet->where($where)->field('Id,UserId,Amount,Release,Gas')->paginate(10);
		$count['release'] = $wallet->sum('`Release`');
		$count['gas'] = $wallet->sum('Gas');
		$count['fcc'] = $wallet->sum('Amount');
		if(input('excel')){		
			$list[] = ['','总合计',$count['fcc'],$count['release'],$count['gas']];
			$name = '货币管理Excel表';
			$header = ['编号','会员编号','FCC','可转移资产','GAS'];
			$this->excleExport($name,$header,$list);
		}
		$this->assign('list',$list);
		$this->assign('count',$count);
		$this->assign('where',input('post.'));
		return $this->fetch();
	}
	//离线发送
	public function send()
	{
		$where = [];
		if(request()->isPost()&&input('post.submit')){
			$where = input('post.');
			foreach ($where as $k => $v) {
				if(!empty($v)||$k=='Way'){
					if($k=='AddTime'){
						$vv = explode(' - ', $v);
						$vv[0] = strtotime($vv[0]);
						$vv[1] = strtotime($vv[1]);
						$vv[1] = implode(',', $vv);
						$vv[0] = 'between';
						$v = $vv;
					}
					$where[$k] = $v;
				}else{
					unset($where[$k]);
				}
			}
		}
		unset($where['submit']);
		$res = db('detail_offline')->where($where)->paginate(10);
		$this->assign('list',$res);
        $this->assign('where', input('post.'));
		return $this->fetch();
	}
	//会员转账
	public function trade()
	{
		$where = [];
		if(request()->isPost()&&input('post.submit')){
			$where = input('post.');
			unset($where['submit']);
			foreach ($where as $k => $v) {
				$v = db('user')->where("Id = '$v'")->field('WalletAdress')->find();
				$v = $v['WalletAdress'];
				if(empty($v)){
					unset($where[$k]);
				}else
					$where[$k] = $v;
			}
		}
		$list = db('detail_online')->where($where)->paginate(10);
		$this->assign('list',$list);
        $this->assign('where', input('post.'));
		return $this->fetch();
	}
	//货币兑换
	public function exchange()
	{
		$where = [];
		if(request()->isPost()&&input('post.submit')){
			$where = input('post.');
			foreach ($where as $k => $v) {
				if(!empty($v)){
					if($k=='AddTime'){
						$vv = explode(' - ', $v);
						$vv[0] = strtotime($vv[0]);
						$vv[1] = strtotime($vv[1]);
						$vv[1] = implode(',', $vv);
						$vv[0] = 'between';
						$v = $vv;
					}
					$where[$k] = $v;
				}else{
					unset($where[$k]);
				}
			}
		}
		unset($where['submit']);
		$where['type'] = 0;
		$list = db('gas_log')->where($where)->field('UserId,NickName,Mobile,Amount,AddTime')->paginate(10);
		if(input('excel')){			
			foreach ($list as $k => $v) {
				$arr[$k] = $v;
				$arr[$k]['AddTime'] = date('Y-m-d H:s:i',$v['AddTime']);
				$arr[$k]['out'] = '可转移资产';
				$arr[$k]['to'] = '转入货币';
				$arr[$k]['scale'] = '1.00 : 100.00';
			}
			$name = '货币兑换Excel表';
			$header = ['会员编号','会员昵称','会员电话','金额','日期','转出货币','转入货币','转换比例'];
			$this->excleExport($name,$header,$arr);
		}
		$this->assign('list',$list);
		$this->assign('where',input('post.'));
		return $this->fetch();
	}
	//财务明细
	public function info()
	{
		if(request()->isPost()&&input('post.submit')){
			$where = input('post.');
			unset($where['submit']);
			foreach ($where as $k => $v) {
				// $k = 'a.'.$k;
				if(!empty($v)){
					if($k=='AddTime'){
						$vv = explode(' - ', $v);
						$vv[0] = strtotime($vv[0]);
						$vv[1] = strtotime($vv[1]);
						$vv[1] = implode(',', $vv);
						$vv[0] = 'between';
						$v = $vv;
					}
					if($k == 'type')
						$type = $v;
					else
						$data['a.'.$k] = $v;
				
				}
			}
			$where = $data;
		}
		$type = ($type)?$type:0;
		switch ($type) {
			case 0:
				$res = db('gas_log')->alias('a')->join('__WALLET__ b','b.UserId = a.UserId','left')->field('a.*,b.Amount Money')->where($where)->paginate(10);
				break;
			case 1:
				$res = db('detail_online')->alias('a')->join('__WALLET__ b','b.UserId = a.UserId','left')->field('a.*,b.Amount Money')->where($where)->paginate(10);
				break;
			case 2:
				$res = db('detail_offline')->alias('a')->join('__WALLET__ b','b.UserId = a.UserId','left')->field('a.*,b.Amount Money')->where($where)->paginate(10);
				break;
			case 3:
				$res = db('controller_current')->alias('a')->join('__WALLET__ b','b.UserId = a.UserId','left')->field('a.*,b.Amount Money')->where($where)->paginate(10);
				break;
		}
		$this->assign('list',$res);
		$this->assign('where',input('post.'));
		return $this->fetch();
	}
	//财务报表
	public function table()
	{
		return $this->fetch('404');
	}
}