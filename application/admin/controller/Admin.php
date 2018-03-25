<?php

/**
 *  后台继承类
 * @file   Admin.php   
 */

namespace app\admin\controller;

use think\Loader;

class Admin extends Common {

    public function index() {
        $where = array();
        if ($group_id = input('group_id')) {
            $where['t2.GroupId'] = $group_id;
            
        }
        $lists = db('admin')->alias('t1')->field('t1.*')
                ->where($where)
                ->join(config('database.prefix').'admin_group_access t2', 't1.Id=t2.UId', 'left')
                ->group('t1.Id')
                ->order('t1.Id desc')
                ->select();
        
        foreach ($lists as $k => $v) {
            //取出组名
            $lists[$k]['Groups'] = '';
            $groups = Loader::model('Admin')->getUserGroups($v['Id']);
            if ($groups) {
                $tmp = db('admin_group')->field('Name')->where('Id', 'in', $groups)->select();

                foreach ($tmp as $vv) {
                    $lists[$k]['groups'] .= $vv['Name'] . ',';
                }
                $lists[$k]['groups'] = trim($lists[$k]['groups'], ',');
            }
        }

        $this->assign('lists', $lists);
        return $this->fetch();
    }

    /*
     * 查看
     */

    public function info() {
        $id = input('id');
        $url = $id?'edit':'add';
        if ($id) {
            //当前用户信息
            $info = model('Admin')->getInfo($id);
            $info['userGroups'] = Loader::model('Admin')->getUserGroups($id);
            $this->assign('info', $info);
        }

        //所有组信息
        $groups = model('AdminGroup')->getGroups();
        $this->assign('groups', $groups);
        $this->assign('url', url($url));
        return $this->fetch();
    }

    /*
     * 添加
     */

    public function add() {
        $data = input();
        $count = db('admin')->where('NickName', $data['NickName'])->count();

        if ($count) {
            $this->error('用户名已存在');
        }

        if ($data['password'] != $data['rpassword']) {
            $this->error('两次密码不一致');
        }

        $data['L1Pwd'] = md5($data['password']);
        $res = model('Admin')->allowField(true)->save($data);

        if ($res) {
            if (isset($data['groups'])) {
                $uid = model('Admin')->id;
                foreach ($data['groups'] as $v) {
                    db('admin_group_access')->insert(['UId' => $uid, 'GroupId' => $v]);
                }
            }
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /*
     * 修改
     */

    public function edit() {
        $data = input();
        db('admin_group_access')->where(['UId' => $data['Id']])->delete();

        if (isset($data['groups'])) {
            foreach ($data['groups'] as $v) {
                db('admin_group_access')->insert(['UId' => $data['Id'], 'GroupId' => $v]);
            }
        }


        if (!$data['password']) {
            unset($data['password']);
        } else {
            if ($data['password'] != $data['rpassword']) {
                $this->error('两次密码不一致!');
            }
            $data['L1Pwd'] = md5($data['password']);
        }

        // p($data);exit();
        $res = Loader::model('Admin')->editInfo(2, $data['Id'], $data);

        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /*
     * 删除
     */

    public function del() {
        $id = input('id');
        $res = db('admin')->where(['Id' => $id])->delete();
        if ($res) {
            db('admin_group_access')->where(['UId' => $id])->delete();
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /**
     * 修改个人信息
     */
    public function public_edit_info() {
        $data = input();
        if (isset($data['dosubmit'])) {
            if (!$data['password']) {
                unset($data['password']);
            } else {
                if ($data['password'] != $data['rpassword']) {
                    $this->error('两次密码不一致!');
                }
                $data['password'] = md5($data['password']);
            }

            $res = Loader::model('Admin')->editInfo(2, $this->user_id, $data);

            if ($res) {
                $this->success('修改成功');
            } else {
                $this->error('修改失败');
            }
        } else {
            $info = db('admin')->where('id', $this->user_id)->find();
            $this->assign('info', $info);
            return $this->fetch();
        }
    }

}
