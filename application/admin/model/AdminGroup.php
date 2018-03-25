<?php

/**
 *  
 * @file   AdminGroup
 */

namespace app\admin\model;

class AdminGroup extends \think\Model {

    public function getGroups() {

        $res = db('admin_group')->field('Id,Name')->select();
        $data = array();
        foreach ($res as $k => $v) {
            $data[$v['Id']] = $v['Name'];
        }
        return $data;
    }

    public function getGroupName($group_id) {
        return db('admin_group')->where(['Id' => $group_id])->value('Name');
    }

}
