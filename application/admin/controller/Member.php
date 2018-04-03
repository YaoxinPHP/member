<?php
namespace app\admin\controller;
use think\Loader;
/**
* 会员管理
*/
class Member extends Common
{
	
	public function index()
	{
		$where = [];
		if(input('post.submit')){
			$where = $_POST;
			foreach ($where as $k => $v) {
				if(!empty($v)){
					if($k=='JiHuoDate'){
						$vv = explode(' - ', $v);
						$vv[0] = strtotime($vv[0]);
						$vv[1] = strtotime($vv[1]);
						$vv[1] = implode(',', $vv);
						$vv[0] = 'between';
						$v = $vv;
					}
					$data[$k] = $v;
				}
			}
			unset($data['submit']);
		}
		$field = input('export')?'Id,NickName,TJUserNickName,JDUserNickName,RegisterDate,JiHuoMemberType':'*';
		$res = db('user')->where($data)->field($field)->order('Id desc')->paginate(10);
		if(input('export')){
			return $this->excleExport($res);
		}
        $this->assign('lists', $res);
        $this->assign('where', $where);
		return $this->fetch();
	}
	public function info()
	{
		if(!request()->isGet()||!preg_match('/^\d*$/',input('Id'))){
			return $this->error('错误参数');
		}
		$info = db('user')->where('Id = '.input('Id'))->find();
		$this->assign('info',$info);
		return $this->fetch();
	}
	public function register()
	{	
		$post = input('post.');
		if(request()->isPost()){
			$validate = Loader::validate('User');
			if(!$validate->scene('register')->check($post)){
			    return $this->error($validate->getError());
			}
			$member = db('user');
            // 生成邀请码
            $nToken = getToken();
			if($post['TJtoken']){
                //有邀请码注册
				$result = $member->where("TJtoken = '$post[TJtoken]'")->find();
                if($result['TJtoken'] !== $post['TJtoken']){
                    return $this->error('邀请码错误');
                }
                $update = [];
	            $updateflag = 'TJLeftValue';
	            $resultId = $result['Id'];
	            $resultRanks = $result['Ranks'];
	            $resultJTRanks = $result['JTRanks'];
	            $resultTime = $result['RanksTime'];
	            switch ($result['IsFull']) {
	                case 0:
	                    $update["$updateflag"] = 0;
	                    $update['IsFull'] = 1;
	                    break;
	                case 1:
	                    $updateflag = 'TJRightValue';
	                    $update["$updateflag"] = 0;
	                    $update['IsFull'] = 3;
	                    break;
	                case 2:
	                    $updateflag = 'TJRightValue';
	                    $update["$updateflag"] = 0;
	                    $update['IsFull'] = 3;
	                    break;
	                case 3:
	                //向下滑

	                    $ranks = explode(',',$result['Ranks']);
	                    $arr = $member->where(['Id'=>['in',$ranks],'IsFull'=>['neq',3]])->find();
	                    if(count($arr)){
	                        if($arr['IsFull']==0){
	                            $updateflag = 'JDLeftValue';
	                            $update["$updateflag"] = 0;
	                            $update['IsFull'] = 2;
	                        }else{
	                            $updateflag = 'JDRightValue';
	                            $update["$updateflag"] = 0;
	                            $update['IsFull'] = 3;
	                        }
	                    }
	                    $resultId = $arr['Id'];
	                    $resultRanks = $arr['Ranks'];
	                    $resultJTRanks = $arr['JTRanks'];
	                    $resultTime = $arr['RanksTime'];
	            }          
	            //注册
	            $data['NickName'] = $post['NickName'];
	            $data['L1Pwd'] = getMd5($post['L1Pwd'],$nToken);
	            //注册等级（推荐人下级与节点无关）
	            $data['RegisterLevelId'] = $result['RegisterLevelId']+1;
	            //推荐人 节点人
	            $data['TJUserId'] = $result['Id'];
	            $data['TJUserNickName'] = $result['NickName'];
	            if($result['Id']!=$resultId){
	                $data['JDUserId'] = $resultId;
	                $data['JDUserNickName'] = $arr['NickName'];
	            }
	            //激活状态
	            $data['JiHuoMemberType'] = $post['JiHuoMemberType'];
	            $data['JiHuoDate'] = time();
	            $data['Mobile'] = $post['Mobile'];
	            $data['TJtoken'] = $nToken;
	            $data['Ranks'] = 0;
	            //钱包地址
	            $data['WalletAdress'] = md5($data['NickName'].$data['Mobile']);
	            $flagid = $member->insertGetId($data);
	            if(!$flagid){
	                return $this->error('注册失败');
	            }
	            //添加钱包
	            model('Wallet')->insert(['UserId'=>$flagid,'UpdateTime'=>time()]);
	            $update["$updateflag"] = $flagid;
	            //更新上游数据
	            $resultArr = $member->where("Ranks like '%,$resultId%'")->field('Id,Ranks,RanksTime')->select();
	            foreach ($resultArr as $v) {
	                //今日增加团队
	                $Ranksdata = ['Ranks'=>$v['Ranks'].','.$flagid];
	                $Ranksdata['JTRanks'] = (date('Ymd',$v['RanksTime'])==date('Ymd'))?$v['JTRanks'].','.$flagid:$flagid;
	                $Ranksdata['RanksTime'] = time();
	                $member->where("Id = $v[Id]")->update($Ranksdata);
	            }
	            //更新数据
	            $update['Ranks'] = $resultRanks.','.$flagid;
	            $update['JTRanks'] = (date('Ymd',$resultTime)==date('Ymd'))?$resultJTRanks.','.$flagid:$flagid;
	            $update['RanksTime'] = time();
	            $flagUp = $member->where("Id = $resultId")->update($update);
	            return $this->success('注册成功');
			}else{
				$data['NickName'] = $post['NickName'];
	            $data['L1Pwd'] = getMd5($post['L1Pwd'],$nToken);
	            //注册等级（推荐人下级与节点无关）
	            $data['RegisterLevelId'] = 1;
	            //激活状态
	            $data['JiHuoMemberType'] = $post['JiHuoMemberType'];
	            $data['JiHuoDate'] = time();
	            $data['Mobile'] = $post['Mobile'];
	            $data['TJtoken'] = $nToken;
	            $data['Ranks'] = 0;
	            //钱包地址
	            $data['WalletAdress'] = ($post['WalletAdress'])?$post['WalletAdress']:md5($data['NickName'].$data['Mobile']);
	            $flagid = $member->insertGetId($data);
	            return ($flagid)?$this->success('注册成功'):$this->error('注册失败');
			}

		}	
		$this->assign('url',url('register'));
		return $this->fetch();
	}
	//锁定 转入转出
	public function opreation()
	{
		if(!request()->isGet()||count($_GET)>1||!preg_match('/^[0,1]$/',input('type'))){
			return $this->error('错误参数');
		}
		if(input('lock')){
			$flag = db('user')->where("Id = ".input('lock'))->update(['IsLock'=>input('type')]);
		}elseif(input('trade')){
			$flag = db('user')->where("Id = ".input('trade'))->update(['Isjiaoyi'=>input('type')]);
		}
		return ($flag)?$this->success('操作成功'):$this->error('操作失败');
	}
	public function edit()
	{
		if(request()->isGet()){
			$info = db('user')->where('Id = '.input('Id'))->find();
			$this->assign('info',$info);
			return $this->fetch('register'); 
		}
		$post = input('post.');
		if(request()->isPost()){
			$validate = Loader::validate('User');
			if(!$validate->scene('register')->check($post)){
			    return $this->error($validate->getError());
			}
			unset($post['RePwd']);
			$flag = db('user')->where("id = $post[Id]")->update($post);
			return ($flag)?$this->success('操作成功'):$this->error('操作失败');
		}
	}
	public function del()
	{
		if(!request()->isGet()||!preg_match('/^\d$/',input('Id'))){
			return $this->error('错误参数');
		}
		$flag = db('user')->delete(input('Id'));
		return ($flag)?$this->success('操作成功'):$this->error('操作失败');
	}
	//重置密码
	public function reset()
	{
		if(!request()->isGet()||!preg_match('/^\d*$/',input('Id'))){
			return $this->error('错误参数');
		}
		$token = db('user')->where("Id = ".input('Id'))->field('TJtoken')->find();
		$pwd = md5('123456'.$token['TJtoken']);
		$flag = db('user')->where("Id = ".input('Id'))->update(['L1Pwd' => $pwd]);
		return ($flag)?$this->success('操作成功'):$this->error('操作失败');
	}
	//导出Excel
	public function excleExport($data)
	{
		 $name='会员管理Excel表';
         $header=['会员编号','昵称','推荐人','节点人','注册时间','状态','本币','可转移资产','钱包地址'];
        excelExport($name,$header,$data);

	}
}