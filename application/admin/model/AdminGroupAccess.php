<?php
// +----------------------------------------------------------------------
// | date: 2018/3/28
// +----------------------------------------------------------------------
// | AdminGroupAccess.php: ****
// +----------------------------------------------------------------------
// | Author: ConRose Li <rows_lrc@163.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use think\model;

class AdminGroupAccess extends Model{

    /**
     *
     * @param int $userid 用户ID
     * @return Array
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