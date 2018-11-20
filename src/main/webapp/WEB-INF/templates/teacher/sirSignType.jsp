<%--
  User: ZouJiaCheng
  Date: 2018/10/20
  Time: 16:16
  Description:  签到详情页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script src="../js/jquery.cookie.js"></script>

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

        .sign-time {
            padding-left: 4vw;
            padding-top: 1vh;
            border-top: 1px solid #C0C0C0;
            border-bottom: 1px solid #C0C0C0;
            padding-bottom: 1vh;
            color: #373d41;
        }

        .comment-num {
            padding-top: 3vh;
            text-align: center;
        }

        .comment-num span {
            font-size: 20px;
            font-weight: bold;
            color: #373d41;
        }

        .CodeNum {
            height: 20vh;
            line-height: 20vh;
            border-bottom: 1px solid #C0C0C0;
            /*margin-top: 2vh;*/
            /*padding-left: 1.5vw;*/
        }

        .CodeNum .beijing {
            display: inline-block;
            width: 13vw;
            height: 15vw;
            line-height: 15vw;
            background-color: #9999;
            color: #fff;
            font-size: 50px;
            /*margin-left: 1vw;*/
            /*padding: 1vh 0;*/
        }

        .qrCodeImg {
            /*重写*/
            width: 160px;
            height: 160px;
            opacity: 0.8;
        }

        .sign-body {
            padding-top: 2vh;
            border-bottom: 1px solid #C0C0C0;
            padding-bottom: 2vh;
        }

        .sign-body-timeEnd {
            width: 50vw;
            display: inline-block;
            text-align: right;
        }

        .sign-body-time {
            width: 6vw;
            height: 6vw;
            line-height: 6vw;
            margin-left: 1vw;
            display: inline-block;
            text-align: left;
            color: red;
        }

        .sign-body-people {
            padding-top: 2vh;
            border-bottom: 1px solid #C0C0C0;
            padding-bottom: 2vh;
        }

        .sign-body-signPeople {
            width: 50vw;
            display: inline-block;
            text-align: right;

        }

        .sign-body-signNum {
            width: 40vw;
            display: inline-block;
            text-align: left;
        }

        .sign-body-signNum span {
            display: inline-block;
            width: 6vw;
            height: 6vw;
            line-height: 6vw;
            text-align: center;
            color: #fff;
            background: #0e0;
            border-radius: 50%;
        }

        .sign-body-noPeople {
            padding-top: 2vh;
            border-bottom: 1px solid #C0C0C0;
            padding-bottom: 2vh;
        }

        .sign-body-noSignPeople {
            width: 50vw;
            display: inline-block;
            text-align: right;
        }

        .sign-body-noSignPeopleNum {
            width: 40vw;
            display: inline-block;
            text-align: left;
        }

        .sign-body-noSignPeopleNum span {
            display: inline-block;
            width: 6vw;
            height: 6vw;
            line-height: 6vw;
            text-align: center;
            color: #fff;
            background: #e00;
            border-radius: 50%;
        }

        .footer-btn {
            width: 100vw;
            text-align: center;
            padding-top: 5vh;
        }

        .buttonl,
        .buttonr {
            width: 30vw;
            display: inline-block;
            height: 6vh;
            line-height: 6vh;
            border: none;
            color: #fff;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            outline: none;
            background-color: #0C88E8;
        }

        .buttonr {
            margin-left: 5vw;
            background-color: red;
        }
    </style>
</head>
<body>
<div id="page-attence">
    <header style="background-color:#464646">
        <a  class="icon-back" onclick="fangqi('${courseCode}','${courseClass}')">
            <img src="../img/common/backWhite.png" style="vertical-align: middle;text-align: center;">
        </a>
        <h2 style="font-size: 19px">
            <span>
                <c:if test="${'2' eq '1'}">
                    二维码签到
                </c:if>
                <c:if test="${'2' eq '2'}">
                    签到码签到
                </c:if>
            </span>
        </h2>
    </header>
    <div class="nav">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
        <span>班级</span>
        <img src="../img/student/jiantou.png">

        <%--获取小班的名字尽量在10个字之内--%>
        <span>${courseclass}</span>

        <img src="../img/student/jiantou.png">
        <c:if test="${'2' eq '1'}">
            <span>二维码签到</span>
        </c:if>
        <c:if test="${'2' eq '2'}">
            <span>签到码签到</span>
        </c:if>
    </div>
    <div class="sign">
        <div class="sign-time">
            <p>
                ${date1} ${date2}
            </p>
        </div>
        <c:if test="${signType eq '1'}">
            <div class="comment-num">
                <div>
                    <span>签到码</span>
                    <div class="CodeNum">
                        <c:forEach items="${signCode}" var="ran">
                            <span class="beijing">${ran}</span>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${signType eq '2'}">
            <div style="padding-left: 15px;padding-top: 15px;padding-right: 15px;text-align: center">
                <div>
                    <span>二维码</span>
                    <div class="qrCode">
                        <img src="../img/qr.jpg" alt="" class="qrCodeImg">
                    </div>
                </div>
            </div>
        </c:if>


        <div class="sign-body">
            <div class="sign-body-timeEnd">
                <p>距离签到结束：</p>
            </div>
            <div class="sign-body-time">
                <%--time签到时间！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！--%>
                <span id="btn" <%--onclick="settime(this,${validTime})"--%>>${validTime}</span>
            </div>
        </div>

        <div class="sign-body-people">
            <div class="sign-body-signPeople">
                <p>已签到人数：</p>
            </div>
            <div class="sign-body-signNum">
                <span id="yidao">0</span>
            </div>
        </div>

        <div class="sign-body-noPeople">
            <div class="sign-body-noSignPeople">
                <p>未签到人数：</p>
            </div>
            <div class="sign-body-noSignPeopleNum">
                <span id="weidao">${count}</span>
            </div>
        </div>

        <div class="footer-btn">
            <button class="buttonl" onclick="fangqi('${courseCode}','${courseClass}')">
                放弃
            </button>
            <button class="buttonr" id="jieshu" onclick="jieshu('${courseCode}','${courseClass}')">
                结束
            </button>
        </div>
    </div>
</div>
<%--
<input type="button"id="shuaxin" style="display: none;" onclick="shuaxin(document.getElementById('yidao'),'${coursecode}','${date1}','${count}',document.getElementById('weidao'))">
--%>




<script type="text/javascript">

    if($.cookie("captcha")) {
        var intDiff = $.cookie("captcha");
        $("#btn").val(intDiff);
        var resend = setInterval(function () {
            intDiff--;
            $("#btn").html(intDiff);
            if (intDiff > 0) {
                $.cookie("captcha", intDiff, {path: '/', expires: (1 / 86400) * intDiff});
            }
            else {
              //  $.alert("倒计时结束");
                clearInterval(resend);
            }
        }, 1000);
    }

    function timer(intDiff){
        var resend = setInterval(function(){
            intDiff--;
            $("#btn").html(intDiff);
            if(intDiff > 0) {
                $.cookie("captcha", intDiff, {path: '/', expires: (1 / 86400) * intDiff});
                $.ajax({
                    type: "POST",
                    url: '/checklast.do',
                    data: {"courseCode":"${courseCode}"},
                    async: false,
                    datetype: 'json',
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (data) {
                        $("#yidao").html(data);
                        $("#weidao").html(parseInt(${count})-parseInt(data));
                    }
                });
            }
            else
            {
                //$.alert("倒计时结束");
                jieshu('${courseCode}','${courseClass}');
                clearInterval(resend);

            }
        }, 1000);


    }

    $().ready(function(){
         timer(parseInt(${validTime}));
    });

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


    function fangqi(courseCode,courseClass) {

        $.confirm("确认放弃？", function() {
            //点击确认后的回调函数
            $.ajax({
                type: "POST",
                url: '/fangqi.do',
                data: {"courseCode": courseCode},
                async: false,
                datetype: 'json',
                error: function (request) {
                    alert("Connection error");
                },
                success: function (data) {
                    if(data==='true'){
                        post('/checkCourseclassall.do',{"courseCode": courseCode,"courseClass": courseClass});
                    }else{
                        alert("发生错误");
                    }

                }
            });
        }, function() {
            //点击取消后的回调函数
        });

    }
    function jieshu(courseCode,courseClass) {
        $.confirm("确认结束？", function() {

            if(courseClass.indexOf("形势与政策")){
                $.ajax({
                    type: "POST",
                    url: '/jieshuxingshi.do',
                    data: {"courseCode": courseCode},
                    async: false,
                    datetype: 'json',
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (data) {
                        if(data==='true'){
                            post('/checkCourseclassall.do',{"courseCode": courseCode,"courseClass": courseClass});
                        }else{
                            alert("发生错误");
                        }

                    }
                });
            }else{
                //点击确认后的回调函数
                $.ajax({
                    type: "POST",
                    url: '/jieshu.do',
                    data: {"courseCode": courseCode},
                    async: false,
                    datetype: 'json',
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (data) {
                        if(data==='true'){
                            post('/checkCourseclassall.do',{"courseCode": courseCode,"courseClass": courseClass});
                        }else{
                            alert("发生错误");
                        }

                    }
                });
            }

        }, function() {
            //点击取消后的回调函数
        });


    }




</script>


</body>
</html>