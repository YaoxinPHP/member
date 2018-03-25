<?php

/**
 *  
 * @file   LogController
 */

namespace app\admin\controller;

class Log extends Common {

    public function index() {
        $where = array();
        $lists = db("admin_log")->where($where)->order('Id desc')->limit(20)->select();
	
        $this->assign('lists', $lists);
        return $this->fetch();
    }

}
