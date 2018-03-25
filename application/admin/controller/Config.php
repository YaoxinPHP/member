<?php

/**
 *  系统设置
 * @file   ConfigController
 */

namespace app\admin\controller;

class Config extends Common {

    public function index() {
        return $this->fetch();
    }

}
