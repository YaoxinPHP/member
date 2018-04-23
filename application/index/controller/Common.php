<?php
namespace app\index\controller;
use think\Controller;
use think\Config;
use think\Cache;
class Common extends Controller{

    protected $userId;
    protected $userInfo;
    public function __construct(\think\Request $request = null) {
        parent::__construct($request);
        header("Access-Control-Allow-Origin: *");  
        header('Access-Control-Allow-Headers: X-Requested-With,X_Requested_With,content-type'); 
        header('Access-Control-Allow-Credentials: true'); 
        header('Access-Control-Allow-Headers: Content-Type,Authorization');
        header('Access-Control-Allow-Methods:GET,POST,OPTIONS,PUT,DELETE');
        header('Access-Control-Expose-Headers: *'); 
        header("Content-type:application/json");
        Config::set('default_return_type','json');
        //判断头部信息
        if(!Cache::get('userInfo_'.$_SERVER['HTTP_AUTHORIZATION']))
        {
            echo json_encode(['status'=>401,'msg'=>'没有权限!']);exit;
        }            
        $this->userInfo = Cache::get('userInfo_'.$_SERVER['HTTP_AUTHORIZATION']);
        $this->userId = $this->userInfo['Id'];
        if($_SERVER['HTTP_AUTHORIZATION'] != Cache::get("token".$this->userId)){
            echo json_encode(['status'=>401,'msg'=>'没有权限'.$this->userId]);exit;
            }            
        $this->wallet = $this->getWallet();
    }
    protected function getWallet()
    {
    	//获取钱包
    	return model('Wallet')->where("UserId = ".$this->userId)->field('Amount,Release,Gas')->find();

    }
    //获取智能算力
    protected function getZN($type=0)
    {
    	$wallet = $this->wallet;
    	$sl = model('BonusSetting')->where("Type = 0")->select();
    	foreach ($sl as $v) {
            if($v['Max']==0){
                if($wallet['Amount']>=$v['Min']){
                    $zn = $wallet['Amount']*$v['Percent'];
                }
            }else{
                if($wallet['Amount']<=$v['Max']&&$wallet['Amount']>=$v['Min']){
                    $zn = $wallet['Amount']*$v['Percent'];
                }
            }
        }
        return $zn;
    }
    //获取节点算力
    protected function getJD()
    {
    	$ranks = ($this->userInfo['JTRanks']!=0)?count(explode(',', $this->userInfo['JTRanks'])):0;
    	$percent = model('BonusParameter')->where("Id = 2")->field('Percent')->find();
    	return $ranks*$percent;
    }
    //刷新Session
    protected function refresh()
    {
    	$mem = model('Member')->where('Id = '.$this->userId)->find();
    	Cache::set('userInfo',$mem,86400);
    	return true; 
    }
}