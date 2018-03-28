<?php
// +----------------------------------------------------------------------
// | date: 2018/3/28
// +----------------------------------------------------------------------
// | AdminGroupAccess.php: ****
// +----------------------------------------------------------------------
// | Author: ConRose Li <rows_lrc@163.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use think\Model;

class AdminGroupAccess extends Model{

    /**
     * @param $uid
     * @return bool|string
     * Author: ConRose Li <rows_lrc@163.com>
     */
    public function getUserGroups($uid) {

        $res = $this->where('UId', $uid)->field('GroupId')->select();

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
}