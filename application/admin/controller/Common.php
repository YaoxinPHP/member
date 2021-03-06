<?php

/**
 * 后台公共文件 
 * @file   Common.php  
 第一次注册卖多少币送等额Gas(第一次)每推荐一个人注册买币后，奖励100GAS
 每天释放本币转入可转移资产
 每天业绩
 每天福利
 每天利息
 奖金转入可转移资产
 每天更新user表jtranks
 */

namespace app\admin\controller;
use think\Config;
use think\Controller;
class Common extends Controller {

    protected $user_id;
    protected $user_name;

    public function __construct(\think\Request $request = null) {

        parent::__construct($request);
        if (!session('user_id')) {

            $this->error('请登陆', 'login/index', '', 0);
        }

        $this->user_id = session('user_id');
        $this->user_name = session('user_name');
        //权限检查
        if (!$this->_checkAuthor($this->user_id)) {
            $this->error('你无权限操作');
        }

        //记录日志
        $this->_addLog();
    }

    /**
     * 权限检查
     */
    private function _checkAuthor($user_id) {
        
        if (!$user_id) {
            return false;
        }
        if($user_id==1){
            return true;
        }
        $c = strtolower(request()->controller());
        $a = strtolower(request()->action());

        if (preg_match('/^public_/', $a)) {
            return true;
        }
        if ($c == 'index' && $a == 'index') {
            return true;
        }
        $menu = model('Menu')->getMyMenu($user_id);
        foreach ($menu as $k => $v) {
            if (strtolower($v['C']) == $c && strtolower($v['A']) == $a) {
                return true;
            }
        }
        return false;
    }

    /**
     * 记录日志
     */
    private function _addLog() {

        $data = array();
        $data['QueryString'] = request()->query()?'?'.request()->query():'';
        $data['M'] = request()->module();
        $data['C'] = request()->controller();
        $data['A'] = request()->action();
        $data['UserId'] = $this->user_id;
        $data['NickName'] = $this->user_name;
        $data['Ip'] = ip2long(request()->ip());
	$data['Time'] = time();
        $arr = array('Index/index','Log/index','Menu/index');
        if (!in_array($data['C'].'/'.$data['A'], $arr)) {
            db('admin_log')->insert($data);
        } 
    }
    //导出Excel
    protected function excleExport($name,$header,$data)
    {
        excelExport($name,$header,$data);

    }
}
