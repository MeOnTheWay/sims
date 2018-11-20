<%--
  User: ZouJiaCheng
  Date: 2018/10/20
  Time: 16:16
  Description:  新建 考勤
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>新建考勤</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <link type="text/css" href="../css/common/common-9baddc8954.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"> </script>

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

        input {
            border: none;
            background-color: #f8f8f8;
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

        .nav {
            height: 4vh;
            padding-top: 1vh;
            padding-left: 4vw;
            padding-bottom: 0.5vh;
            /*border: 1px solid red;*/
        }

        .nav span {
            /*border: 1px solid grey;*/
            line-height: 2vh;
            font-size: 4vw;
            color: #373d41;
        }

        .nav img {
            /*border: 1px solid grey;*/
            width: 4vw;
            height: 2vh;
            transform: translateY(0.2vh);
        }

        .nav-time {
            padding-left: 4vw;
            height: 6vh;
            line-height: 6vh;
            font-size: 18px;
            border-top: 1px solid #C0C0C0;
            border-bottom: 1px solid #C0C0C0;
            color: #373d41;
        }

        .nav-timeEnd {
            width: 15vw;
            display: block;
            margin-right: 5vw;
            float: right;
            color: #04BE02;
            font-size: 18px;
            margin-top: 1.5vh;
        }

        .signType {
            padding-top: 1vh;
            font-size: 18px;
        }

        .signName {
            padding-bottom: 1vh;
            margin-left: 4vw;
            font-size: 18px;
            color: #373d41;;
        }

        .signBody {
            border-bottom: 1px solid #C0C0C0;
            margin-top: 1vh;
            padding-bottom: 15vh;
            height: 18vh;
        }

        .bodyNum {
            margin-left: 4vw;
            border: 2px solid #04BE02;
            float: left;
            width: 42vw;
            text-align: center;
            padding-bottom: 1vh;
        }

        .numBox {
            width: 42vw;
            height: 46vw;
            display: inline-block;
            /*border: 1px solid red;*/
            position: relative;
        }

        .numName {
            margin-top: 10vw;
            display: block;
            font-size: 15px;
            font-weight: bold;
            color: #373d41;
            padding-bottom: 1vh;
        }

        .numCode {
            height: 15vw;
            line-height: 15vw;
            text-align: center;
        }

        .numCode span {
            display: inline-block;
            width: 8vw;
            height: 10vw;
            line-height: 10vw;
            color: #fff;
            background-color: #999;
            font-weight: bold;
            font-size: 20px;
        }

        .bodyQr {
            margin-right: 4vw;
            border: 2px solid #C0C0C0;
            float: right;
            width: 42vw;
            text-align: center;
            padding-bottom: 1vh;
        }

        .QrBox {
            width: 42vw;
            height: 46vw;
            display: inline-block;
            /*border: 1px solid red;*/
            position: relative;
        }

        .qrName {
            margin-top: 5vw;
            display: block;
            font-size: 15px;
            color: #373d41;
            font-weight: bold;
        }

        .qrImg {
            margin-top: 2vw;
            width: 26vw;
            opacity: 0.6;
        }

        .duigou {
            width: 10vw;
            height: 10vw;
            position: absolute;
            right: 1vw;
            bottom: 0;
        }

        .imgduigou {
            display: none;
        }

        .btnDiv {
            text-align: center;
            padding-top: 4vh;
        }

        button {
            width: 50vw;
            height: 7vh;
            background-color: #FF0033;
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 2vw;
        }

        .comment {
            /*border: 1px solid red;*/
            margin: 4vh auto;
            text-align: center;
            font-size: 10px;
            color: #888;
        }

        .show {
            display: block;
        }

        .hidden {
            display: none;
        }

        .hbarod {
            border: 2px solid #C0C0C0;
        }

        .sbarod {
            border: 2px solid #04BE02;
        }
    </style>
</head>
<body>
<div id="page-attence">
    <header style="background-color:#464646">
        <a href="javascript:history.back(-1)" class="icon-back">
            <img src="../img/common/backWhite.png" style="vertical-align: middle;text-align: center;">
        </a>
        <h2 style="font-size: 19px">新建签到</h2>
    </header>
    <div class="nav">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
        <span>班级</span>
        <img src="../img/student/jiantou.png">

        <%--获取小班的名字尽量在10个字之内--%>
        <span>${courseclass}</span>

        <img src="../img/student/jiantou.png">
        <span>签到</span>
    </div>
    <div>
        <div class="nav-time">
            <p>请选择有效时间：
                <%--<span id="changetime1" class="nav-timeEnd">30</span>--%>
                <input type="text" id="changetime1" class="nav-timeEnd" value="30">
            </p>
        </div>
        <div class="signType">
            <p class="signName">签到方式</p>
            <div class="signBody">
                <div class="bodyNum" id="signCode" o>
                    <div class="numBox">
                        <p class="numName">数字码签到</p>
                        <div class="numCode">
                            <span>1</span>
                            <span>2</span>
                            <span>3</span>
                            <span>4</span>
                        </div>
                        <img src="../img/duigou.png" class="duigou" >
                    </div>
                </div>
                <div class="bodyQr" id="qrCode" >
                    <div class="QrBox">
                        <p class="qrName">二维码签到</p>
                        <img  class="qrImg" src="../img/qr.jpg">
                        <img id="duigou" src="../img/duigou.png" style="display: none">
                    </div>
                </div>
            </div>
        </div>
        <div class="btnDiv">
            <button style="width: 50%;height: 40px; text-align: center" id="btn" onclick="fqqd('${courseclass}','${coursecode}')">
                发起签到
            </button>
        </div>
        <div class="comment">
            开始签到后，系统在您设定的有效时间内自动结束考勤，<br>
            您也可以手动提前结束或者放弃考勤。
        </div>
    </div>
</div>


<script>
    $("#changetime1").select({
        title: "选择时间",
        items: [
            {
                title: "30",
                value: "30"
            },
            {
                title: "60",
                value: "60"
            },
            {
                title: "90",
                value: "90"
            },
            {
                title: "120",
                value: "120"
            },
            {
                title: "240",
                value: "240"
            }
        ]
    });

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
                    $.alert("请在手机端发起签到");
                    console.log("配置weixin jsapi失败");
                    return false;
                }
            },
            error:function() {
                $.alert("请在手机端发起签到");
                console.log("配置请求错误");
                return false;

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
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }

    function fqqd(courseclass,coursecode) {


        //默认签到方式为签到码签到
        var signType = "1";
        if($('.duigou').parent().parent().attr('id')=="signCode")
        {
            signType="1";
        }
        else
        {
            signType="2";

            $.alert("暂不支持二维码签到");
            return false;
        }




        wx.getLocation({
            type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
            success: function (res) {
                /*                var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                                var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                                var speed = res.speed; // 速度，以米/每秒计
                                var accuracy = res.accuracy; // 位置精度

                                var locations = {
                                    latitude:latitude,
                                    longitude:longitude
                                }*/


                var validTime = $("#changetime1").val();
                $.post('/startSign',{"validTime":validTime,"courseClass":courseclass,"signType":signType,"courseCode":coursecode,"signAddress":JSON.stringify(res)},function(data){

                    if(data==='error'){
                        $.alert("今日该课程已发起过签到");
                    }else {
                        var obj =  JSON.parse(data);
                        var signCode = obj.signCode;
                        post("/signPage",{"signType":signType,"signCode":signCode,"validTime":validTime,"courseClass":courseclass,"courseCode":coursecode});
                    }
                });



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

        $("#signCode").click(function () {
            $(this).find('img').addClass("duigou");
            $(this).find('img').css('display','block');
            $(this).css("border","2px solid #04BE02");
            $(this).siblings().css("border","2px solid #C0C0C0");

            $(this).siblings().find('img').last().css('display','none');
            $(this).siblings().find('img').last().removeClass("duigou");


        });

        $("#qrCode").click(function () {
            $(this).find('img').last().addClass("duigou");
            $(this).css("border","2px solid #04BE02");
            $(this).find('img').last().css('display','block');
            $(this).siblings().css("border","2px solid #C0C0C0");
            $(this).siblings().find('img').removeClass("duigou");
            $(this).siblings().find('img').css('display','none');
        });
        }
    );
</script>

</body>
</html>