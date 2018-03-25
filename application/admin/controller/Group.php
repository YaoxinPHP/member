<?php

/**
 *  
 * @file   GroupController
 */

namespace app\admin\controller;

class Group extends Common {

    public function index() {
        $res = db('admin_group')->select();
        $this->assign('lists', $res);
        return $this->fetch();
    }

    /*
     * 查看
     */

    public function info() {
        $id = input('id');
        if ($id) {
            //当前用户信息
            $info = db('admin_group')->find($id);
            $this->assign('info', $info);
        }
        $this->assign('url',url($id?'edit':'add'));
        return $this->fetch();
    }

    /*
     * 添加
     */

    public function add() {
        $data = input();
        $res = model('Admin_group')->allowField(true)->save($data);
        if ($res) {
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
        $data['UpdateTime'] = time();
        $res = model('Admin_group')->allowField(true)->save($data, ['Id' => $data['Id']]);
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
        $res = db('admin_group')->where(['Id' => $id])->delete();
        if ($res) {
            db('admin_group_access')->where(['GroupId'=>$id])->delete();
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /**
     * 权限
     */
    public function rule() {

        //echo APP_PATH;exit;
        if (input('gid')) {
            $gid = input('gid');
            $rules = db('admin_group')->where('id',$gid)->value('Rules');
            $this->assign('Rules',$rules);
            
            $menu = db('menu')->order('ListOrder asc')->select();
            $this->assign('menu', list_to_tree($menu));
            return $this->fetch();
        }
    }

    public function editRule() {
        $post = input();
        if ($post['Id']) {
            $where = ['Id' => $post['Id']];

            $rules = implode(',', $post['Rules']);
            $data = array();
            $data['UpdateTime'] = time();
            $data['Rules'] = $rules;

            $res = model('admin_group')->save($data, $where);

            if ($res) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        }
    }

}
