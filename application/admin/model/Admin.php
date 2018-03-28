<?php

/**
 *  
 * @file   admin.php  
 */

namespace app\admin\model;

use think\Db;

class Admin extends \think\Model {

    public $status = array(1 => '无效', 2 => '有效');

    public function getInfo($id) {
        return $this->field('Id,NickName,LastLoginIp,LastLoginTime,mobile,status')
                ->where(array('Id' => $id))
                ->find();
    }

    /**
     * 
     * @param int $userid 用户ID
     * @return Array
     */
    public function getUserGroups($uid) {

        $res = db('admin_group_access')->field('GroupId')->where('UId', $uid)->select();

        $userGroups = '';
        if ($res) {
            foreach ($res as $k => $v) {
                $userGroups .= $v['GroupId'] . ',';
            }
            return trim($userGroups, ',');
        } else {
            return false;
        }
    }

    /**
     * 登陆更新
     * @param int $type 1:登陆更新,2:信息更新
     * @param int $id id
     * @param array $data 更新的数据
     */
    public function editInfo($type, $id, $data = array()) {
        
        if ($type == 1) {
            $data['LastLoginTime'] = time();
            $data['LastLoginIp'] = ip2long(request()->ip());
        } elseif ($type == 2) {
            $data['UpdateTime'] = time();
        }
        $res = $this->allowField(true)->save($data, ['Id' => $id]);

        return $res;
    }

}
