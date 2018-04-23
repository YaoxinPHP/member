<?php
namespace app\index\controller;
class Qrcode extends \think\Controller{	
    //二维码
    public function getQrcode()
    {
    	$url = 'a';
        getQrcodeImg($url);
    }
    //链接二维码
    public function getQrcodeLeft()
    {
        $res = model('Member')->where('Id = '.input('id'))->field('RegisterLevelId,TJLeftValue,TJRightValue,JDLeftValue,JDRightValue,Ranks')->find();
        if(haveSeat($res)){
            $arr = findTJ($res);
            $tj = 'T_'.$arr['Id'];
        }else     
            $tj = 'T_left_'.input('id');
        $url = 'http://m.com/wap/register.html?tj='.lock_url($tj);
        getQrcodeImg($url);
    }
    //链接二维码
    public function getQrcodeRight()
    {
        $res = model('Member')->where('Id = '.input('id'))->field('RegisterLevelId,TJLeftValue,TJRightValue,JDLeftValue,JDRightValue,Ranks')->find();
        if(haveSeat($res,'right')){
            $arr = findTJ($res);
            $tj = 'T_'.$arr['Id'];
        }else     
            $tj = 'T_right_'.input('id');
        $url = 'http://m.com/wap/register.html?tj='.lock_url($tj);
        getQrcodeImg($url);
    }
    //发送验证码
    public function sendCode()
    {
        $code = rand(1000,9999);
        $p = input('phone');
        Cache::set($p.'_smsVali',$code);
        echo $code;
    }
}