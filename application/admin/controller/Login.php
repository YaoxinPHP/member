<?php

/**
 *  登陆页
 * @file   Login.php  
 */

namespace app\admin\controller;

use think\Controller;
use think\Loader;

class Login extends Controller {

    /**
     * 登入
     */
    public function index() {
        if (request()->isPost()) {
            $username = input('post.username');
            $password = input('post.password');

            if (!$username) {
                $this->error('用户名不能为空');
            }
            if (!$password) {
                $this->error('密码不能为空');
            }

            $info = db('admin')->field('Id,NickName,L1Pwd')->where('NickName', $username)->find();

            if (!$info) {
                $this->error('用户不存在');
            }

            if (md5($password) != $info['L1Pwd']) {
                $this->error('密码不正确');
            } else {
                session('user_name', $info['NickName']);
                session('user_id', $info['Id']);
                if (input('post.islogin')) {
                    cookie('user_name', encry_code($info['NickName']));
                    cookie('user_id', encry_code($info['Id']));
                }

                //记录登录信息
                Loader::model('Admin')->editInfo(1, $info['Id']);
                $this->success('登入成功', 'index/index');
            }
        } else {
            if (session('user_name')) {
                $this->success('您已登入', 'index/index');
            }

            if (cookie('user_name')) {
                $username = encry_code(cookie('user_name'),'DECODE');
                $info = db('admin')->field('Id,NickName,L1Pwd')->where('NickName', $username)->find();
                if ($info) {
                    //记录
                    session('user_name', $info['NickName']);
                    session('user_id', $info['Id']);
                    Loader::model('Admin')->editInfo(1, $info['Id']);
                    $this->success('登入成功', 'index/index');
                }
            }

            $this->view->engine->layout(false);
            return $this->fetch('login');
        }
    }

    /**
     * 登出
     */
    public function logout() {
        session('user_name', null);
        session('user_id', null);
        cookie('user_name', null);
        cookie('user_id', null);
        $this->success('退出成功', 'login/index');
    }

}
