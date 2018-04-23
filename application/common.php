<?php
/**
 * 公共方法
 *
 *
 */

function isWeixin()
{
    $agent = $_SERVER['HTTP_USER_AGENT'];
    if (strpos($agent, "MicroMessenger") !== false) {
        return true;
    } else {
        return false;
    }
}

/**
 * 检验是否是手机浏览器
 * @return bool
 */
function checkWapAgent()
{
    $agent = $_SERVER['HTTP_USER_AGENT'];
    if (strpos($agent, "comFront") || strpos($agent, "iPhone") || strpos($agent, "MIDP-2.0") || strpos($agent,
            "Opera Mini") || strpos($agent, "UCWEB") || strpos($agent, "Android") || strpos($agent,
            "Windows CE") || strpos($agent, "SymbianOS")
    ) {
        return true;
    }
    return false;
}

/**
 * 加密、解密字符串
 *
 * @param $string 待处理字符串
 * @param $action 操作，ENCODE|DECODE
 * @return string
 */
function StrCode($string, $action = 'ENCODE')
{
    $action != 'ENCODE' && $string = base64_decode($string);
    $code = '';
    $key = substr(md5($_SERVER['HTTP_USER_AGENT'] . "myhash"), 8, 18);
    $keyLen = strlen($key);
    $strLen = strlen($string);
    for ($i = 0; $i < $strLen; $i++) {
        $k = $i % $keyLen;
        $code .= $string[$i] ^ $key[$k];
    }
    return ($action != 'DECODE' ? base64_encode($code) : $code);
}

/**
 * 获取core/config下配置文件内容
 * 使用方法;getConfig('file.key1.key2.key3')
 * @param $key
 * @return array
 */
function getConfig($key)
{
    $keys = explode('.', $key);
    $file = BASE_CORE_PATH . "/config/{$keys[0]}.php";
    if (!file_exists($file)) {
        return [];
    }
    $params = include $file;
    unset($keys[0]);
    $returnParams = [];
    if (!empty($keys)) {
        foreach ($keys as $k) {
            if (isset($tempParams)) {
                if (is_array($tempParams)) {
                    $returnParams = $tempParams = $tempParams[$k];
                } else {
                    break;
                }
            } else {
                $returnParams = $tempParams = $params[$k];
            }
        }
    } else {
        $returnParams = $params;
    }
    return $returnParams;
}

/**
 * 接口数据返回格式
 * @param $resquests
 * @return array
 */
function requestsData($resquests)
{
    $jsonData = jsonData();
    if ($resquests->status_code == 200) {
        $statisticsInfo = json_decode($resquests->body, true);
        $jsonData['data'] = $statisticsInfo['data'];
        $jsonData['code'] = $statisticsInfo['code'];
        $jsonData['msg'] = $statisticsInfo['msg'];
        $jsonData['status'] = $statisticsInfo['status'];
    } else {
        $jsonData['msg'] = '网络连接失败，请稍后重试';
    }
    return $jsonData;
}


/**
 * json返回格式
 * @param int $code
 * @param array $data
 * @param string $msg
 * @param bool $status
 * @return array
 */
function jsonData($code = 0, $data = [], $msg = "", $status = false)
{
    return ['code' => $code, 'data' => $data, 'msg' => $msg, 'status' => $status];
}


/**
 * 产生验证码
 *
 * @param string $nchash 哈希数
 * @return string
 */
function makeSeccode($nchash)
{
    $seccode = random(6, 1);
    $seccodeunits = '';

    $s = sprintf('%04s', base_convert($seccode, 10, 23));
    $seccodeunits = 'ABCEFGHJKMPRTVXY2346789';
    if ($seccodeunits) {
        $seccode = '';
        for ($i = 0; $i < 4; $i++) {
            $unit = ord($s{$i});
            $seccode .= ($unit >= 0x30 && $unit <= 0x39) ? $seccodeunits[$unit - 0x30] : $seccodeunits[$unit - 0x57];
        }
    }
    setNcCookie('seccode', encrypt(strtoupper($seccode) . "\t" . time(), MD5_KEY), 3600);
    return $seccode;
}

/**
 * 验证验证码
 *
 * @param string $nchash 哈希数
 * @param string $value 待验证值
 * @return boolean
 */
function checkSeccode($nchash, $value)
{
    list($checkvalue, $checktime) = explode("\t", decrypt(cookie('seccode'), MD5_KEY));
    $return = $checkvalue == strtoupper($value);
    if (!$return) {
        setNcCookie('seccode', '', -3600);
    }
    return $return;
}

/**
 * 设置cookie
 *
 * @param string $name cookie 的名称
 * @param string $value cookie 的值
 * @param int $expire cookie 有效周期
 * @param string $path cookie 的服务器路径 默认为 /
 * @param string $domain cookie 的域名
 * @param string $secure 是否通过安全的 HTTPS 连接来传输 cookie,默认为false
 */
function setNcCookie($name, $value, $expire = '3600', $path = '', $domain = '', $secure = false)
{
    if (empty($path)) {
        $path = '/';
    }
    if (empty($domain)) {
        $domain = SUBDOMAIN_SUFFIX ? SUBDOMAIN_SUFFIX : '';
    }
    $name = defined('COOKIE_PRE') ? COOKIE_PRE . $name : strtoupper(substr(md5(MD5_KEY), 0, 4)) . '_' . $name;
    $expire = intval($expire) ? intval($expire) : (intval(SESSION_EXPIRE) ? intval(SESSION_EXPIRE) : 3600);
    $result = setcookie($name, $value, time() + $expire, $path, $domain, $secure);
    $_COOKIE[$name] = $value;
}

/**
 * 当访问的act或op不存在时调用此函数并退出脚本
 *
 * @param string $act
 * @param string $op
 * @return void
 */
function requestNotFound($act = null, $op = null)
{
    showMessage('您访问的页面不存在！', SHOP_SITE_URL, 'exception', 'error', 1, 3000);
    exit;
}

/**
 * 输出信息
 *
 * @param string $msg 输出信息
 * @param string /array $url 跳转地址 当$url为数组时，结构为 array('msg'=>'跳转连接文字','url'=>'跳转连接');
 * @param string $show_type 输出格式 默认为html
 * @param string $msg_type 信息类型 succ 为成功，error为失败/错误
 * @param string $is_show 是否显示跳转链接，默认是为1，显示
 * @param int $time 跳转时间，默认为2秒
 * @return string 字符串类型的返回结果
 */
function showMessage($msg, $url = '', $show_type = 'html', $msg_type = 'succ', $is_show = 1, $time = 2000)
{
    if (!class_exists('Language')) {
        import('libraries.language');
    }
    Language::read('core_lang_index');
    $lang = Language::getLangContent();
    /**
     * 如果默认为空，则跳转至上一步链接
     */
    $url = ($url != '' ? $url : getReferer());

    $msg_type = in_array($msg_type, array('succ', 'error')) ? $msg_type : 'error';

    /**
     * 输出类型
     */
    switch ($show_type) {
        case 'json':
            $return = '{';
            $return .= '"msg":"' . $msg . '",';
            $return .= '"url":"' . $url . '"';
            $return .= '}';
            echo $return;
            break;
        case 'exception':
            echo '<!DOCTYPE html>';
            echo '<html>';
            echo '<head>';
            echo '<meta http-equiv="Content-Type" content="text/html; charset=' . CHARSET . '" />';
            echo '<title></title>';
            echo '<style type="text/css">';
            echo 'body { font-family: "Verdana";padding: 0; margin: 0;}';
            echo 'h2 { font-size: 12px; line-height: 30px; border-bottom: 1px dashed #CCC; padding-bottom: 8px;width:800px; margin: 20px 0 0 150px;}';
            echo 'dl { float: left; display: inline; clear: both; padding: 0; margin: 10px 20px 20px 150px;}';
            echo 'dt { font-size: 14px; font-weight: bold; line-height: 40px; color: #333; padding: 0; margin: 0; border-width: 0px;}';
            echo 'dd { font-size: 12px; line-height: 40px; color: #333; padding: 0px; margin:0;}';
            echo '</style>';
            echo '</head>';
            echo '<body>';
            echo '<h2>' . $lang['error_info'] . '</h2>';
            echo '<dl>';
            echo '<dd>' . $msg . '</dd>';
            echo '<dt><p /></dt>';
            echo '<dd>' . $lang['error_notice_operate'] . '</dd>';
            echo '<dd><p /><p /><p /><p /></dd>';
            echo '</dl>';
            echo '</body>';
            echo '</html>';
            exit;
            break;
        case 'javascript':
            echo "<script>";
            echo "alert('" . $msg . "');";
            echo "location.href='" . $url . "'";
            echo "</script>";
            exit;
            break;
        case 'frame':
            echo "<html><head>";
            echo "<meta name=\"TENCENT_ONLINE_PAYMENT\" content=\"China TENCENT\">";
            echo "<script language=\"javascript\">";
            echo "alert('" . $msg . "');";
            echo "parent.location.href=" . $url . "";
            echo "</script>";
            echo "</head><body></body></html>";
            exit;
            break;
        case 'tenpay':
            echo "<html><head>";
            echo "<meta name=\"TENCENT_ONLINE_PAYMENT\" content=\"China TENCENT\">";
            echo "<script language=\"javascript\">";
            echo "window.location.href='" . $url . "';";
            echo "</script>";
            echo "</head><body></body></html>";
            exit;
            break;
        default:
            /**
             * 不显示右侧工具条
             */
            Tpl::output('hidden_nctoolbar', 1);
            if (is_array($url)) {
                foreach ($url as $k => $v) {
                    $url[$k]['url'] = $v['url'] ? $v['url'] : getReferer();
                }
            }
            /**
             * 读取信息布局的语言包
             */
            Language::read("msg");
            /**
             * html输出形式
             * 指定为指定项目目录下的error模板文件
             */
            Tpl::setDir('');
            Tpl::output('html_title', Language::get('nc_html_title'));
            Tpl::output('msg', $msg);
            Tpl::output('url', $url);
            Tpl::output('msg_type', $msg_type);
            Tpl::output('is_show', $is_show);
            Tpl::showpage('msg', 'msg_layout', $time);
    }
    exit;
}

/**
 * 消息提示，主要适用于普通页面AJAX提交的情况
 *
 * @param string $message 消息内容
 * @param string $url 提示完后的URL去向
 * @param stting $alert_type 提示类型 error/succ/notice 分别为错误/成功/警示
 * @param string $extrajs 扩展JS
 * @param int $time 停留时间
 */
function showDialog($message = '', $url = '', $alert_type = 'error', $extrajs = '', $time = 2)
{
    if (empty($_GET['inajax'])) {
        if ($url == 'reload') {
            $url = '';
        }
        showMessage($message . $extrajs, $url, 'html', $alert_type, 1, $time * 1000);
    }
    $message = str_replace("'", "\\'", strip_tags($message));

    $paramjs = null;
    if ($url == 'reload') {
        $paramjs = 'window.location.reload()';
    } elseif ($url != '') {
        $paramjs = 'window.location.href =\'' . $url . '\'';
    }
    if ($paramjs) {
        $paramjs = 'function (){' . $paramjs . '}';
    } else {
        $paramjs = 'null';
    }
    $modes = array('error' => 'alert', 'succ' => 'succ', 'notice' => 'notice', 'js' => 'js');
    $cover = $alert_type == 'error' ? 1 : 0;
    $extra .= 'showDialog(\'' . $message . '\', \'' . $modes[$alert_type] . '\', null, ' . ($paramjs ? $paramjs : 'null') . ', ' . $cover . ', null, null, null, null, ' . (is_numeric($time) ? $time : 'null') . ', null);';
    $extra = $extra ? '<script type="text/javascript" reload="1">' . $extra . '</script>' : '';
    if ($extrajs != '' && substr(trim($extrajs), 0, 7) != '<script') {
        $extrajs = '<script type="text/javascript" reload="1">' . $extrajs . '</script>';
    }
    $extra .= $extrajs;
    ob_end_clean();
    @header("Expires: -1");
    @header("Cache-Control: no-store, private, post-check=0, pre-check=0, max-age=0", false);
    @header("Pragma: no-cache");
    @header("Content-type: text/xml; charset=" . CHARSET);

    $string = '<?xml version="1.0" encoding="' . CHARSET . '"?>' . "\r\n";
    $string .= '<root><![CDATA[' . $message . $extra . ']]></root>';
    echo $string;
    exit;
}



/**
 * 取上一步来源地址
 *
 * @param
 * @return string 字符串类型的返回结果
 */
function getReferer()
{
    return str_replace(array('\'', '"', '<', '>'), '', $_SERVER['HTTP_REFERER']);
}

/**
 * 取验证码hash值
 *
 * @param
 * @return string 字符串类型的返回结果
 */
function getNchash($act = '', $op = '')
{
    $act = $act ? $act : $_GET['act'];
    $op = $op ? $op : $_GET['op'];
    if (C('captcha_status_login')) {
        return substr(md5(SHOP_SITE_URL . $act . $op), 0, 8);
    } else {
        return '';
    }
}

/**
 * 加密函数
 *
 * @param string $txt 需要加密的字符串
 * @param string $key 密钥
 * @return string 返回加密结果
 */
function encrypt($txt, $key = '')
{
    if (empty($txt)) {
        return $txt;
    }
    if (empty($key)) {
        $key = md5(MD5_KEY);
    }
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.";
    $ikey = "-x6g6ZWm2G9g_vr0Bo.pOq3kRIxsZ6rm";
    $nh1 = rand(0, 64);
    $nh2 = rand(0, 64);
    $nh3 = rand(0, 64);
    $ch1 = $chars{$nh1};
    $ch2 = $chars{$nh2};
    $ch3 = $chars{$nh3};
    $nhnum = $nh1 + $nh2 + $nh3;
    $knum = 0;
    $i = 0;
    while (isset($key{$i})) {
        $knum += ord($key{$i++});
    }
    $mdKey = substr(md5(md5(md5($key . $ch1) . $ch2 . $ikey) . $ch3), $nhnum % 8, $knum % 8 + 16);
    $txt = base64_encode(time() . '_' . $txt);
    $txt = str_replace(array('+', '/', '='), array('-', '_', '.'), $txt);
    $tmp = '';
    $j = 0;
    $k = 0;
    $tlen = strlen($txt);
    $klen = strlen($mdKey);
    for ($i = 0; $i < $tlen; $i++) {
        $k = $k == $klen ? 0 : $k;
        $j = ($nhnum + strpos($chars, $txt{$i}) + ord($mdKey{$k++})) % 64;
        $tmp .= $chars{$j};
    }
    $tmplen = strlen($tmp);
    $tmp = substr_replace($tmp, $ch3, $nh2 % ++$tmplen, 0);
    $tmp = substr_replace($tmp, $ch2, $nh1 % ++$tmplen, 0);
    $tmp = substr_replace($tmp, $ch1, $knum % ++$tmplen, 0);
    return $tmp;
}

/**
 * 解密函数
 *
 * @param string $txt 需要解密的字符串
 * @param string $key 密匙
 * @return string 字符串类型的返回结果
 */
function decrypt($txt, $key = '', $ttl = 0)
{
    if (empty($txt)) {
        return $txt;
    }
    if (empty($key)) {
        $key = md5(MD5_KEY);
    }

    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.";
    $ikey = "-x6g6ZWm2G9g_vr0Bo.pOq3kRIxsZ6rm";
    $knum = 0;
    $i = 0;
    $tlen = @strlen($txt);
    while (isset($key{$i})) {
        $knum += ord($key{$i++});
    }
    $ch1 = @$txt{$knum % $tlen};
    $nh1 = strpos($chars, $ch1);
    $txt = @substr_replace($txt, '', $knum % $tlen--, 1);
    $ch2 = @$txt{$nh1 % $tlen};
    $nh2 = @strpos($chars, $ch2);
    $txt = @substr_replace($txt, '', $nh1 % $tlen--, 1);
    $ch3 = @$txt{$nh2 % $tlen};
    $nh3 = @strpos($chars, $ch3);
    $txt = @substr_replace($txt, '', $nh2 % $tlen--, 1);
    $nhnum = $nh1 + $nh2 + $nh3;
    $mdKey = substr(md5(md5(md5($key . $ch1) . $ch2 . $ikey) . $ch3), $nhnum % 8, $knum % 8 + 16);
    $tmp = '';
    $j = 0;
    $k = 0;
    $tlen = @strlen($txt);
    $klen = @strlen($mdKey);
    for ($i = 0; $i < $tlen; $i++) {
        $k = $k == $klen ? 0 : $k;
        $j = strpos($chars, $txt{$i}) - $nhnum - ord($mdKey{$k++});
        while ($j < 0) {
            $j += 64;
        }
        $tmp .= $chars{$j};
    }
    $tmp = str_replace(array('-', '_', '.'), array('+', '/', '='), $tmp);
    $tmp = trim(base64_decode($tmp));

    if (preg_match("/\d{10}_/s", substr($tmp, 0, 11))) {
        if ($ttl > 0 && (time() - substr($tmp, 0, 11) > $ttl)) {
            $tmp = null;
        } else {
            $tmp = substr($tmp, 11);
        }
    }
    return $tmp;
}

/**
 * 取得IP
 *
 *
 * @return string 字符串类型的返回结果
 */
function getIp()
{
    if (@$_SERVER['HTTP_CLIENT_IP'] && $_SERVER['HTTP_CLIENT_IP'] != 'unknown') {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (@$_SERVER['HTTP_X_FORWARDED_FOR'] && $_SERVER['HTTP_X_FORWARDED_FOR'] != 'unknown') {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return preg_match('/^\d[\d.]+\d$/', $ip) ? $ip : '';
}

/**
 * 读取目录列表
 * 不包括 . .. 文件 三部分
 *
 * @param string $path 路径
 * @return array 数组格式的返回结果
 */
function readDirList($path)
{
    if (is_dir($path)) {
        $handle = @opendir($path);
        $dir_list = array();
        if ($handle) {
            while (false !== ($dir = readdir($handle))) {
                if ($dir != '.' && $dir != '..' && is_dir($path . DS . $dir)) {
                    $dir_list[] = $dir;
                }
            }
            return $dir_list;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

/**
 * 转换特殊字符
 *
 * @param string $string 要转换的字符串
 * @return string 字符串类型的返回结果
 */
function replaceSpecialChar($string)
{
    $str = str_replace("\r\n", "", $string);
    $str = str_replace("\t", "    ", $string);
    $str = str_replace("\n", "", $string);
    return $string;
}

/**
 * 获取目录大小
 *
 * @param string $path 目录
 * @param int $size 目录大小
 * @return int 整型类型的返回结果
 */
function getDirSize($path, $size = 0)
{
    $dir = @dir($path);
    if (!empty($dir->path) && !empty($dir->handle)) {
        while ($filename = $dir->read()) {
            if ($filename != '.' && $filename != '..') {
                if (is_dir($path . DS . $filename)) {
                    $size += getDirSize($path . DS . $filename);
                } else {
                    $size += filesize($path . DS . $filename);
                }
            }
        }
    }
    return $size ? $size : 0;
}

/**
 * 获取文件列表(所有子目录文件)
 *
 * @param string $path 目录
 * @param array $file_list 存放所有子文件的数组
 * @param array $ignore_dir 需要忽略的目录或文件
 * @return array 数据格式的返回结果
 */
function readFileList($path, &$file_list, $ignore_dir = array())
{
    $path = rtrim($path, '/');
    if (is_dir($path)) {
        $handle = @opendir($path);
        if ($handle) {
            while (false !== ($dir = readdir($handle))) {
                if ($dir != '.' && $dir != '..') {
                    if (!in_array($dir, $ignore_dir)) {
                        if (is_file($path . DS . $dir)) {
                            $file_list[] = $path . DS . $dir;
                        } elseif (is_dir($path . DS . $dir)) {
                            readFileList($path . DS . $dir, $file_list, $ignore_dir);
                        }
                    }
                }
            }
            @closedir($handle);
//			return $file_list;
        } else {
            return false;
        }
    } else {
        return false;
    }
}



/**
 * 字符串切割函数，一个字母算一个位置,一个字算2个位置
 *
 * @param string $string 待切割的字符串
 * @param int $length 切割长度
 * @param string $dot 尾缀
 */
function str_cut($string, $length, $dot = '')
{
    $string = str_replace(array(
        '&nbsp;',
        '&amp;',
        '&quot;',
        '&#039;',
        '&ldquo;',
        '&rdquo;',
        '&mdash;',
        '&lt;',
        '&gt;',
        '&middot;',
        '&hellip;'
    ), array(' ', '&', '"', "'", '“', '”', '—', '<', '>', '·', '…'), $string);
    $strlen = strlen($string);
    if ($strlen <= $length) {
        return $string;
    }
    $maxi = $length - strlen($dot);
    $strcut = '';
    if (strtolower(CHARSET) == 'utf-8') {
        $n = $tn = $noc = 0;
        while ($n < $strlen) {
            $t = ord($string[$n]);
            if ($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
                $tn = 1;
                $n++;
                $noc++;
            } elseif (194 <= $t && $t <= 223) {
                $tn = 2;
                $n += 2;
                $noc += 2;
            } elseif (224 <= $t && $t < 239) {
                $tn = 3;
                $n += 3;
                $noc += 2;
            } elseif (240 <= $t && $t <= 247) {
                $tn = 4;
                $n += 4;
                $noc += 2;
            } elseif (248 <= $t && $t <= 251) {
                $tn = 5;
                $n += 5;
                $noc += 2;
            } elseif ($t == 252 || $t == 253) {
                $tn = 6;
                $n += 6;
                $noc += 2;
            } else {
                $n++;
            }
            if ($noc >= $maxi) {
                break;
            }
        }
        if ($noc > $maxi) {
            $n -= $tn;
        }
        $strcut = substr($string, 0, $n);
    } else {
        $dotlen = strlen($dot);
        $maxi = $length - $dotlen;
        for ($i = 0; $i < $maxi; $i++) {
            $strcut .= ord($string[$i]) > 127 ? $string[$i] . $string[++$i] : $string[$i];
        }
    }
    $strcut = str_replace(array('&', '"', "'", '<', '>'), array('&amp;', '&quot;', '&#039;', '&lt;', '&gt;'),
        $strcut);
    return $strcut . $dot;
}

/**
 * unicode转为utf8
 * @param string $str 待转的字符串
 * @return string
 */
function unicodeToUtf8($str, $order = "little")
{
    $utf8string = "";
    $n = strlen($str);
    for ($i = 0; $i < $n; $i++) {
        if ($order == "little") {
            $val = str_pad(dechex(ord($str[$i + 1])), 2, 0, STR_PAD_LEFT) .
                str_pad(dechex(ord($str[$i])), 2, 0, STR_PAD_LEFT);
        } else {
            $val = str_pad(dechex(ord($str[$i])), 2, 0, STR_PAD_LEFT) .
                str_pad(dechex(ord($str[$i + 1])), 2, 0, STR_PAD_LEFT);
        }
        $val = intval($val, 16); // 由于上次的.连接，导致$val变为字符串，这里得转回来。
        $i++; // 两个字节表示一个unicode字符。
        $c = "";
        if ($val < 0x7F) { // 0000-007F
            $c .= chr($val);
        } elseif ($val < 0x800) { // 0080-07F0
            $c .= chr(0xC0 | ($val / 64));
            $c .= chr(0x80 | ($val % 64));
        } else { // 0800-FFFF
            $c .= chr(0xE0 | (($val / 64) / 64));
            $c .= chr(0x80 | (($val / 64) % 64));
            $c .= chr(0x80 | ($val % 64));
        }
        $utf8string .= $c;
    }
    /* 去除bom标记 才能使内置的iconv函数正确转换 */
    if (ord(substr($utf8string, 0, 1)) == 0xEF && ord(substr($utf8string, 1, 2)) == 0xBB && ord(substr($utf8string,
            2,
            1)) == 0xBF
    ) {
        $utf8string = substr($utf8string, 3);
    }
    return $utf8string;
}

// 记录和统计时间（微秒）
function addUpTime($start, $end = '', $dec = 3)
{
    static $_info = array();
    if (!empty($end)) { // 统计时间
        if (!isset($_info[$end])) {
            $_info[$end] = microtime(true);
        }
        return number_format(($_info[$end] - $_info[$start]), $dec);
    } else { // 记录时间
        $_info[$start] = microtime(true);
    }
}

/**
 * 取得随机数
 *
 * @param int $length 生成随机数的长度
 * @param int $numeric 是否只产生数字随机数 1是0否
 * @return string
 */
function random($length, $numeric = 0)
{
    $seed = base_convert(md5(microtime() . $_SERVER['DOCUMENT_ROOT']), 16, $numeric ? 10 : 35);
    $seed = $numeric ? (str_replace('0', '', $seed) . '012340567890') : ($seed . 'zZ' . strtoupper($seed));
    $hash = '';
    $max = strlen($seed) - 1;
    for ($i = 0; $i < $length; $i++) {
        $hash .= $seed{mt_rand(0, $max)};
    }
    return $hash;
}


/**
 * 内容写入文件
 *
 * @param string $filepath 待写入内容的文件路径
 * @param string /array $data 待写入的内容
 * @param  string $mode 写入模式，如果是追加，可传入“append”
 * @return bool
 */
function write_file($filepath, $data, $mode = null)
{
    if (!is_array($data) && !is_scalar($data)) {
        return false;
    }

    $data = var_export($data, true);

    $data = "<?php defined('In33hao') or exit('Access Invalid!'); return " . $data . ";";
    $mode = $mode == 'append' ? FILE_APPEND : null;
    if (false === file_put_contents($filepath, ($data), $mode)) {
        return false;
    } else {
        return true;
    }
}

/**
 * 循环创建目录
 *
 * @param string $dir 待创建的目录
 * @param  $mode 权限
 * @return boolean
 */
function mk_dir($dir, $mode = '0777')
{
    if (is_dir($dir) || @mkdir($dir, $mode)) {
        return true;
    }
    if (!mk_dir(dirname($dir), $mode)) {
        return false;
    }
    return @mkdir($dir, $mode);
}

/**
 * 去除代码中的空白和注释
 *
 * @param string $content 待压缩的内容
 * @return string
 */
function compress_code($content)
{
    $stripStr = '';
    //分析php源码
    $tokens = token_get_all($content);
    $last_space = false;
    for ($i = 0, $j = count($tokens); $i < $j; $i++) {
        if (is_string($tokens[$i])) {
            $last_space = false;
            $stripStr .= $tokens[$i];
        } else {
            switch ($tokens[$i][0]) {
                case T_COMMENT:    //过滤各种PHP注释
                case T_DOC_COMMENT:
                    break;
                case T_WHITESPACE:    //过滤空格
                    if (!$last_space) {
                        $stripStr .= ' ';
                        $last_space = true;
                    }
                    break;
                default:
                    $last_space = false;
                    $stripStr .= $tokens[$i][1];
            }
        }
    }
    return $stripStr;
}


/**
 * 返回以原数组某个值为下标的新数据
 *
 * @param array $array
 * @param string $key
 * @param int $type 1一维数组2二维数组
 * @return array
 */
function array_under_reset($array, $key, $type = 1)
{
    if (is_array($array)) {
        $tmp = array();
        foreach ($array as $v) {
            if ($type === 1) {
                $tmp[$v[$key]] = $v;
            } elseif ($type === 2) {
                $tmp[$v[$key]][] = $v;
            }
        }
        return $tmp;
    } else {
        return $array;
    }
}


/**
 * 将字符部分加密并输出
 * @param unknown $str
 * @param unknown $start 从第几个位置开始加密(从1开始)
 * @param unknown $length 连续加密多少位
 * @return string
 */
function encryptShow($str, $start, $length)
{
    $end = $start - 1 + $length;
    $array = str_split($str);
    foreach ($array as $k => $v) {
        if ($k >= $start - 1 && $k < $end) {
            $array[$k] = '*';
        }
    }
    return implode('', $array);
}
/*
    验证码
*/
function getCaptcha()
{
    $captcha = new \think\captcha\Captcha($config);
    return $captcha->entry();
}
/*
    验证码验证
*/
function valiCaptcha($value)
{
    $imgVali = new \think\captcha\ Captcha();
    return ($imgVali->check($value))?true:false;
}
/*
    邀请码
*/
function getToken(){
    return sprintf('%x',crc32(microtime()));
}
/*
    密码加密
*/
function getMd5($pwd,$code)
{
    return md5($pwd.$code);
}
/*
    二维码
*/
function getQrcodeImg($url)
{
    //生成当前的二维码
    $qrCode = new \Endroid\QrCode\QrCode();
    $qrCode->setText($url)
        ->setSize(300)//大小
        ->setLabelFontPath(VENDOR_PATH.'endroid/qrcode/assets/noto_sans.otf')
        ->setErrorCorrectionLevel('high')
        ->setForegroundColor(array('r' => 0, 'g' => 0, 'b' => 0, 'a' => 0))
        ->setBackgroundColor(array('r' => 255, 'g' => 255, 'b' => 255, 'a' => 0))
        ->setLabel('')
        ->setLabelFontSize(16);
    header('Content-Type: '.$qrCode->getContentType());
    echo $qrCode->writeString();
}
/*================*/
// 应用公共文件
function p($str) {
    echo '<pre>';
    print_r($str);
}

function nodeTree($arr, $id = 0, $level = 0) {
    static $array = array();
    foreach ($arr as $v) {
        if ($v['ParentId'] == $id) {
            $v['level'] = $level;
            $array[] = $v;
            nodeTree($arr, $v['Id'], $level + 1);
        }
    }
    return $array;
}

/**
 * 数组转树
 * @param type $list
 * @param type $root
 * @param type $pk
 * @param type $pid
 * @param type $child
 * @return type
 */
function list_to_tree($list, $root = 0, $pk = 'Id', $pid = 'ParentId', $child = '_child') {
    // 创建Tree
    $tree = array();
    if (is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] = &$list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId = 0;
            if (isset($data[$pid])) {
                $parentId = $data[$pid];
            }
            if ((string) $root == $parentId) {
                $tree[] = &$list[$key];
            } else {
                if (isset($refer[$parentId])) {
                    $parent = &$refer[$parentId];
                    $parent[$child][] = &$list[$key];
                }
            }
        }
    }
    return $tree;
}

/**
 * 下拉选择框
 */
function select($array = array(), $id = 0, $str = '', $default_option = '') {
    $string = '<select ' . $str . '>';
    $default_selected = (empty($id) && $default_option) ? 'selected' : '';
    if ($default_option)
        $string .= "<option value='' $default_selected>$default_option</option>";
    if (!is_array($array) || count($array) == 0)
        return false;
    $ids = array();
    if (isset($id))
        $ids = explode(',', $id);
    foreach ($array as $key => $value) {
        $selected = in_array($key, $ids) ? 'selected' : '';
        $string .= '<option value="' . $key . '" ' . $selected . '>' . $value . '</option>';
    }
    $string .= '</select>';
    return $string;
}

/**
 * 复选框
 * 
 * @param $array 选项 二维数组
 * @param $id 默认选中值，多个用 '逗号'分割
 * @param $str 属性
 * @param $defaultvalue 是否增加默认值 默认值为 -99
 * @param $width 宽度
 */
function checkbox($array = array(), $id = '', $str = '', $defaultvalue = '', $width = 0, $field = '') {
    $string = '';
    $id = trim($id);
    if ($id != '')
        $id = strpos($id, ',') ? explode(',', $id) : array($id);
    if ($defaultvalue)
        $string .= '<input type="hidden" ' . $str . ' value="-99">';
    $i = 1;
    foreach ($array as $key => $value) {
        $key = trim($key);
        $checked = ($id && in_array($key, $id)) ? 'checked' : '';
        if ($width)
            $string .= '<label class="ib" style="width:' . $width . 'px">';
        $string .= '<input type="checkbox" ' . $str . ' id="' . $field . '_' . $i . '" ' . $checked . ' value="' . $key . '"> ' . $value;
        if ($width)
            $string .= '</label>';
        $i++;
    }
    return $string;
}

/**
 * 单选框
 * 
 * @param $array 选项 二维数组
 * @param $id 默认选中值
 * @param $str 属性
 */
function radio($array = array(), $id = 0, $str = '', $width = 0, $field = '') {
    $string = '';
    foreach ($array as $key => $value) {
        $checked = trim($id) == trim($key) ? 'checked' : '';
        if ($width)
            $string .= '<label class="ib" style="width:' . $width . 'px">';
        $string .= '<input type="radio" ' . $str . ' id="' . $field . '_' . $key . '" ' . $checked . ' value="' . $key . '"> ' . $value;
        if ($width)
            $string .= '</label>';
    }
    return $string;
}

/**
 * 字符串加密、解密函数
 *
 *
 * @param   string  $txt        字符串
 * @param   string  $operation  ENCODE为加密，DECODE为解密，可选参数，默认为ENCODE，
 * @param   string  $key        密钥：数字、字母、下划线
 * @param   string  $expiry     过期时间
 * @return  string
 */
function encry_code($string, $operation = 'ENCODE', $key = '', $expiry = 0) {
    $ckey_length = 4;
    $key = md5($key != '' ? $key : config('encry_key'));
    $keya = md5(substr($key, 0, 16));
    $keyb = md5(substr($key, 16, 16));
    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) : substr(md5(microtime()), -$ckey_length)) : '';

    $cryptkey = $keya . md5($keya . $keyc);
    $key_length = strlen($cryptkey);

    $string = $operation == 'DECODE' ? base64_decode(strtr(substr($string, $ckey_length), '-_', '+/')) : sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $keyb), 0, 16) . $string;
    $string_length = strlen($string);

    $result = '';
    $box = range(0, 255);

    $rndkey = array();
    for ($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }

    for ($j = $i = 0; $i < 256; $i++) {
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }

    for ($a = $j = $i = 0; $i < $string_length; $i++) {
        $a = ($a + 1) % 256;
        $j = ($j + $box[$a]) % 256;
        $tmp = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }

    if ($operation == 'DECODE') {
        if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        return $keyc . rtrim(strtr(base64_encode($result), '+/', '-_'), '=');
    }
}

/**

 * excel表格导出

 * @param string $fileName 文件名称

 * @param array $headArr 表头名称

 * @param array $data 要导出的数据

 * @author static7  */

function excelExport($fileName = '', $headArr = [], $data = []) {

    $fileName .= "_" . date("Y_m_d", time()) . ".xls";

    $objPHPExcel = new \PHPExcel();

    $objPHPExcel->getProperties();

    $key = ord("A"); // 设置表头

    foreach ($headArr as $v) {

        $colum = chr($key);

        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);

        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);

        $key += 1;

    }

    $column = 2;

    $objActSheet = $objPHPExcel->getActiveSheet();

    foreach ($data as $key => $rows) { // 行写入

        $span = ord("A");

        foreach ($rows as $keyName => $value) { // 列写入

            $objActSheet->setCellValue(chr($span) . $column, $value);

            $span++;

        }

        $column++;

    }

    $fileName = iconv("utf-8", "gb2312", $fileName); // 重命名表

    $objPHPExcel->setActiveSheetIndex(0); // 设置活动单指数到第一个表,所以Excel打开这是第一个表

    header('Content-Type: application/vnd.ms-excel');

    header("Content-Disposition: attachment;filename='$fileName'");

    header('Cache-Control: max-age=0');

    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');

    $objWriter->save('php://output'); // 文件通过浏览器下载

    exit();

}
//获取api内容
function getApi($url,$type='get',$post='')
{
  $curl = curl_init();
  curl_setopt($curl, CURLOPT_URL, $url);
  curl_setopt($curl, CURLOPT_HEADER, 1);
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
  if($type=='post')
  {
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
  }
  $data = curl_exec($curl);
  curl_close($curl);
  return $data;
}
//交易所加密方式
function getSign($id,$token)
{
    return strtoupper(md5($id.$token));
}
//判断地址是否存在
function isAddress($url)
{
    $info = @get_headers($url);
    return is_array($info) ? preg_match('/^HTTP\\/\\d+\\.\\d+\\s+2\\d\\d\\s+.*$/',$info[0]) : false;
}
//抓取信息
function getInfo($url,$id,$token)
{
    $post = [
        'client_id' => $id,
        'sign'      => getSign($id,$token),
    ];
    return getApi($url,'post',$post);
}
//生成验证token
function setToken($str)
{
    return md5($str.microtime());
}
//找寻tj位
function findTJ($res,$num='')
{
    //标识符
    $flag = $num?$num:$res['RegisterLevelId']+1;
    $ranks = explode(',',substr($res['Ranks'], 2));
    $arr = db('user')->where(['Id'=>['in',$ranks],'IsFull'=>['neq',3],'RegisterLevelId'=>$flag])->field('Id,NickName,Ranks,JTRanks,RanksTime')->find();
    if(empty($arr)){
        findTj($res,$flag+1);
    }else{
        return $arr;
    }
}
function haveSeat($res,$flag='left')
{
    if($flag=='right'){
       return (!$res['TJRightValue'])?(!$res['JDRightValue'])?false:true:true;
    }
    return (!$res['TJLeftValue'])?(!$res['JDLeftValue'])?false:true:true;
}
//加密函数
function lock_url($txt,$key='')
{
  $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-=+";
  $nh = rand(0,64);
  $ch = $chars[$nh];
  $mdKey = md5($key.$ch);
  $mdKey = substr($mdKey,$nh%8, $nh%8+7);
  $txt = base64_encode($txt);
  $tmp = '';
  $i=0;$j=0;$k = 0;
  for ($i=0; $i<strlen($txt); $i++) {
    $k = $k == strlen($mdKey) ? 0 : $k;
    $j = ($nh+strpos($chars,$txt[$i])+ord($mdKey[$k++]))%64;
    $tmp .= $chars[$j];
  }
  return urlencode($ch.$tmp);
}
//解密函数
function unlock_url($txt,$key='')
{
  $txt = urldecode($txt);
  $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-=+";
  $ch = $txt[0];
  $nh = strpos($chars,$ch);
  $mdKey = md5($key.$ch);
  $mdKey = substr($mdKey,$nh%8, $nh%8+7);
  $txt = substr($txt,1);
  $tmp = '';
  $i=0;$j=0; $k = 0;
  for ($i=0; $i<strlen($txt); $i++) {
    $k = $k == strlen($mdKey) ? 0 : $k;
    $j = strpos($chars,$txt[$i])-$nh - ord($mdKey[$k++]);
    while ($j<0) $j+=64;
    $tmp .= $chars[$j];
  }
  return base64_decode($tmp);
}