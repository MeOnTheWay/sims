<%--
  User: Jiang Jiahong
  Date: 2018/1/5
  Time: 15:52
  Description: 学生签到页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>微信签到</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
    <style type="text/css">
        body {
            width: 100vw;
            height: 100%;
            margin: 0 auto;
            padding: 0;
            display: flex;
            font-size: 14px;
            position: relative;
            overflow: hidden;
            background-color: #f8f8f8;
            color: #2d2d2d;
            -webkit-box-orient: vertical;
            flex-direction: column;
            font-family: HY-XiZYJ, HY_XiZYJ, Arial, '微软雅黑', YaHei, Helvetica Neue, Helvetica, STHeiTi, sans-serif;
        }

        li {
            list-style: none;
        }

        input {
            border: none;
        }

        .page-inner {
            display: flex;
            flex-direction: column;
            height: 100%;
            -webkit-box-orient: vertical;
        }

        header {
            width: 100%;
            display: flex;
            -webkit-box-align: center;
            line-height: 7.5vh;
            color: #fff;
            position: relative;
            height: 7.5vh;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-align-items: center;
            background-color: #464646
        }

        header .icon-back {
            text-align: center;
            vertical-align: middle;
            width: 55px;
            display: block;
            color: #2d2d2d;
            background: 0 0;
            outline: 0;
            max-width: 100%;
            border: 0;
        }

        header h2 {
            font-weight: 400;
            padding-left: 5%;
            -webkit-box-flex: 8;
            flex: 8;
            font-size: 19px
        }

        header a {
            -webkit-tap-highlight-color: transparent;
            text-decoration: none;
            float: right;
            width: 30px;
            padding-right: 10px;

        }

        header a img {
            border: none;
            max-width: 100%;
            float: right;
            width: 30px;
            padding-right: 10px;
        }

        .classSign {
            width: 100vw;
            height: auto;
            margin-top: 10px;
        }

        .className {
            padding: 1vh 10vw 1vh;
            font-size: 0;
            color: #ffff;
            background: #48cafd;
        }

        .className .name {
            font-size: 16px;
        }

        .className .teacher {
            font-size: 14px;
        }

        .numSign {
            height: auto;
            margin-top: 15px;
            position: relative;
        }

        .numType {
            color: #828282;
            font-size: 14px;
            text-align: center;
            line-height: 20px;
        }

        .bipt {
            position: relative;
        }

        input {
            margin-top: 3vh;
            width: 40vw;
            height: 40px;
            border: 1px solid #0C88E8;
            font-size: 15px;
            margin-left: 10vw;
            border-radius: 5px;
            outline: none;
            padding-left:10px
        }

        button {
            color: #fff;
            height: 40px;
            border: none;
            text-align: center;
            text-decoration: none;
            font-size: 15px;
            border-radius: 5px;
            outline: none;
        }

        .qiandao {
            width: 25vw;
            background: #dc4532;
            margin-left: 10vw;
            position: absolute;
            top: 3vh;
        }

        .jilu {
            margin-top: 4vh;
            margin-left: 10vw;
            width: 75vw;
            background: #3a86f6;
        }
    </style>

</head>
<body>
<div class="page-inner">
    <header>
        <a href="javascript:history.back(-1)" class="icon-back">
            <img src="../img/common/backWhite.png">
        </a>
        <h2>签到</h2>
    </header>

    <div class="classSign">
        <div class="className">
            <span class="name">课程：${coursename}</span><br>
            <span class="teacher">老师：${teachername}</span>
        </div>
        <div class="numSign">
            <div class="numType">
                <span>请输入六位数字签到码，手动完成签到<br>
                (签到码由教师获取并告知)</span>
            </div>
            <div class="bipt">
                <input id="checkma" type="text" oninput="value=value.replace(/[^\d]/g,'')">
                <button class="qiandao" onclick="check1(document.getElementById('checkma').value,'${coursecode}')">签到</button>
            </div>
            <div>
                <button class="jilu">查看我的签到记录</button>
            </div>
        </div>
    </div>

</div>
</body>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"> </script>
<script type="text/javascript">
    function configWx() {
        var thisPageUrl = location.href.split('#')[0];
        var json = {
            url : thisPageUrl
        };

        $.ajax({
            url:"/wechat/getJsTicket",
            data:json,
            dataType:"json",
            success:function(data) {
                if (data != null) {
                    configWeiXin(data.corpId, data.timestamp, data.nonceStr,
                        data.signature);
                } else {
                    console.log("配置weixin jsapi失败");
                }
            },
            error:function() {
                console.log("配置请求错误");
            }

        });

    }

    function configWeiXin(corpId, timestamp, nonceStr, signature) {
        wx.config({
            debug : false,// 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId : corpId,
            timestamp : timestamp,
            nonceStr : nonceStr,
            signature : signature,
            jsApiList : [ 'chooseImage', 'uploadImage', 'downloadImage',
                'previewImage', 'openLocation', 'getLocation',
                'scanQRCode', 'checkJsApi', 'onMenuShareTimeline',
                'onMenuShareAppMessage', 'onMenuShareQQ',
                'onMenuShareWeibo', 'onMenuShareQZone' ]
        });
    }
    function post(URL, PARAMS) {
        var temp = document.createElement("form");
        temp.action = URL;
        temp.method = "post";
        temp.style.display = "none";
        for (var x in PARAMS) {
            var opt = document.createElement("textarea");
            opt.name = x;
            opt.value = PARAMS[x];
            // alert(opt.name)
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
    function check1(checkma,coursecode) {
        wx.getLocation({
            type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
            success: function (res) {
                if(checkma==null||checkma==""){
                    alert("请输入签到码")
                }else{
                    // alert(checkma);
                    $.ajax({
                        type: "POST",
                        url: '/addstucheck.do',
                        data: {"checkma": checkma,"coursecode":coursecode,"signAddress":JSON.stringify(res)},
                        async: false,
                        datetype: 'json',
                        error: function (request) {
                            alert("Connection error");
                        },
                        success: function (data) {
                            if(data==="true"){
                                // swal("成功！", "信息已修改", "success")
                                // setTimeout(function () {window.location.reload(); }, 1700);
                                alert("成功");
                                post("/getStuClass",{})
                            }else if (data==="false"){
                                alert("验证码错误");
                            }else{
                                alert("未在指定范围50米以内签到");
                            }
                        }
                    });
                }



            },
            cancel: function (res) {
                $.alert('用户拒绝授权获取地理位置');
            },
            error:function (res) {
                return res;
            }

        });

    }
    $().ready(function(){
        configWx();
    })
</script>
</html>