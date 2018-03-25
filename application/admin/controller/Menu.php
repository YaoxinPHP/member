<?php

/**
 *  
 * @file   Menu.php  
 */

namespace app\admin\controller;

use think\Loader;

class Menu extends Common {

    public function index() {
        $res = db('menu')->order('ListOrder asc')->select();
        $lists = nodeTree($res);
        $this->assign('lists', $lists);
        return $this->fetch();
    }

    /*6
     * 查看
     */

    public function info() {


        $id = input('id');
        if ($id) {
            //当前用户信息
            $info = db('menu')->find($id);
            $this->assign('info', $info);
        }
        //下拉菜单
        $this->assign('selectMenu', Loader::model('Menu')->selectMenu());
        $this->assign('url', url($id?'edit':'add'));
        return $this->fetch();
    }

    /*
     * 添加
     */

    public function add() {
        $data = input();
        if ($data['ParentId'] == null) {
            $data['ParentId'] = 0;
        }
        $res = model('menu')->allowField(true)->save($data);
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
        if ($data['ParentId'] == null) {
            $data['ParentId'] = 0;
        }

        $res = model('menu')->allowField(true)->save($data, ['Id' => $data['Id']]);
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
        $res = db('menu')->where(['Id' => $id])->delete();
        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /**
     * 排序
     */
    public function setListorder() {
        if ($_POST['ListOrder']) {
            $listorder = $_POST['ListOrder'];
            foreach ($listorder as $k => $v) {
                $data = array();
                $data['ListOrder'] = $v;
                $data['UpdateTime'] = time();
                $res = db('menu')->where(['Id' => $k])->update($data);
            }
            if ($res) {
                $this->success('操作成功', url('index'));
            } else {
                $this->error('操作失败');
            }
        }
    }

}
