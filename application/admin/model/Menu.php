<?php

/**
 *  
 * @file   Menu.php  
 */

namespace app\admin\model;

use think\Model;

class Menu extends Model {

    public $display = array('1' => '显示', '2' => '不显示');

    /**
     * 获取当前方法名
     * @return type
     */
    public function getName() {
        $where = array();
        $where['C'] = request()->controller();
        $where['A'] = request()->action();
        $res = $this->where($where)->field('Id,MenuName,ParentId')->find();
        return $res['MenuName'];
    }

    public function getInfo() {
        $where = array();
        $where['C'] = request()->controller();
        $where['A'] = request()->action();
        $res = $this->where($where)->field('Id,MenuName,ParentId')->find();
        return $res;
    }

    /**
     * 获取前当标题
     * @return type
     */
    public function getTitle() {
        $info = $this->getInfo();
        $title = '';
        if ($info->ParentId) {
            $parentName = $this->where('Id', $info->ParentId)->value('MenuName');

            $title = $parentName . '  <small><i class="ace-icon fa fa-angle-double-right"></i> ' . $info['MenuName'] . '</small>';
        } else {
            $title = $info['MenuName'];
        }
        return $title;
    }

    /**
     * 获取上级方法名
     * @return boolean
     */
    public function getParentNname() {

        $info = $this->getInfo();
        if ($info->ParentId) {
            return $this->where('Id', $info->ParentId)->value('MenuName');
        } else {
            return false;
        }
    }

    /**
     * 择选栏目
     */
    public function selectMenu() {
        $res = db('menu')
                ->field('Id,MenuName,Parentid')
                ->order('ListOrder asc')
                ->select();
        $tmpArr = nodeTree($res);

        $data = array();
        foreach ($tmpArr as $k => $v) {
            $name = $v['level'] == 0 ? '<b>' . $v['MenuName'] . '</b>' : '├─' . $v['MenuName'];

            $name = str_repeat("│        ", $v['level']) . $name;
            $data[$v['Id']] = $name;
        }
        // dump($data);
        //exit;
        return $data;
    }

    /**
     * 所有菜单
     * @return type
     */
    public function allMenu() {
        $res = db('menu')
                ->field('Id,MenuName,ParentId')
                ->order('ListOrder asc')
                ->select();
        return nodeTree($res);
    }

    /**
     * 我的菜单
     * @param type $user_id
     * @param type $display 
     * @return array
     */
    public function getMyMenu($user_id, $display = null) {
        $where = array();
        if ($user_id != 1) {
            $res = db('admin_group_access')
                    ->alias('t1')
                    ->field('t2.Rules')
                    ->join(config('database.prefix').'admin_group t2', 't1.GroupId=t2.Id', 'left')
                    ->where(['t1.UId' => $user_id])
                    ->select();
            if (!$res) {
                return false;
            }
            $tmp = '';
            foreach ($res as $k => $v) {
                $tmp .=$v['Rules'] . ',';
            }

            $menu_ids = trim($tmp, ',');
            $where['Id'] = ['in', $menu_ids];
        }


        if ($display) {
            $where['Display'] = $display;
        }

        $res = db('menu')->where($where)->order('ListOrder asc')->select();

        return $res;
    }

}
