<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>签到主页</title>
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

        .page-inner {
            display: flex;
            flex-direction: column;
            height: 100%;
            -webkit-box-orient: vertical;
        }

        .nTitle {
            height: 4vh;
            padding-top: 1vh;
            padding-left: 4vw;
            padding-bottom: 0.5vh;
            /*border: 1px solid red;*/
        }

        .nTitle span {
            /*border: 1px solid grey;*/
            line-height: 2vh;
            font-size: 4vw;
            color: #373d41;
        }

        .nTitle img {
            /*border: 1px solid grey;*/
            width: 4vw;
            height: 2vh;
            transform: translateY(0.2vh);
        }

        .nBox {
            width: 100vw;
            border-top: 1px solid #C0C0C0;
        }

        .nav {
            border-bottom: 1px solid #C0C0C0;
            width: 100vw;
            height: 9vh;
            line-height: 9vh;
        }

        .nav-list {
            text-align: center;
            border: none;
        }

        .nav-list .nav-item {
            /*border: 1px solid #555555;*/
            padding: 2.5vw 2.5vw;
            background: #5cb8e3;
            color: #fff;
            font-size: 12px;
            border-radius: 2vw;
        }

        .nav-list .cr {
            background: #fe8362;
        }

        .nav-list .cg {
            background: #55d3bd;
        }

        .nav-list .co {
            background: #fbca74;
        }

        .workspace {
            width: 100%;
            -webkit-box-flex: 1;
            flex: 1;
            overflow: auto;
            overflow-x: hidden;
            padding-bottom: 52px;
        }

        .content {
            height: 10vh;
            border-bottom: 1px solid #C0C0C0;
            color: #373d41;
            background-color: #f8f8f8 !important;
        }

        .content .list-time {
            /*border: 1px solid blue;*/
            font-size: 12px;
            margin-left: 4vw;
            padding-top: 2vh;
        }

        .content .list-item {
            /*border: 1px solid gold;*/
            font-size: 14px;
            margin-left: 4vw;
            position: relative;
        }

        .list-item .item-data {
            /*border: 1px solid red;*/
            width: 75vw;
            float: left;
            color: #373d41;
            margin-top: 1vh;
            height: 0;
            font-size: 12px;
        }

        .list-item .item-view {
            width: 15vw;
            height: 5vh;
            line-height: 5vh;
            text-align: center;
            position: absolute;
            right: 4vw;
            top: -1vh;
            font-size: 14px;
            background-color: #82bffd;
            border-radius: 5px;
        }

        .cent {
            height: 10vh;
            width: 17vw;
            line-height: 10vh;
            text-align: center;
            padding: 0;
        }

        .list-item .item-view a {
            color: #fff;
        }

        .qrCode {
            position: absolute;
            /*left: 50%;*/
            /*transform: translate(-50%, -50%);*/
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, .3);
            z-index: 1000;
        }

        .qrCode > img {
            position: absolute;
            width: 70%;
            height: auto;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .hidden {
            display: none;
        }

        footer {
            width: 100%;
            height: 50px;
            border-top: 1px solid #c8c8c8;
            display: -webkit-box;
            letter-spacing: 0;
            background: #fff;
            font-size: 13px;
            overflow: hidden;
            padding-bottom: 2px;
            position: fixed;
            bottom: 0;
            z-index: 100;
        }

        footer a {
            color: #818181;
            display: block;
            padding-top: 3px;
            text-align: center;
            -webkit-box-flex: 1;
            -webkit-tap-highlight-color: transparent;
            background: 0 0;
            outline: 0;
            text-decoration: none;
        }

        footer a div.navSelf {
            width: 36px;
            margin: 0 auto;
            position: relative;
        }

        footer .iconfont {
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: .2px;
            display: block;
            line-height: 1;
            font-size: 3.1rem;
            font-style: normal;
            color: #818181;
        }

        footer img {
            border: none;
            max-width: 80%;
        }

        footer span {
            display: block;
            margin-top: 2px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="qrCode hidden" id="qrcode" onclick="xiaoshiqrcode()">
    <img src="../img/teacher/qrCode.png">
</div>
<div class="page-inner" id="page-main-view">
    <div class="nTitle">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
        <span>班级</span>
        <img src="../img/student/jiantou.png">

        <%--获取小班的名字尽量在10个字之内--%>
        <span>${courseClass}</span>
    </div>
    <div class="nBox">
        <table class="nav">
            <tr>
                <th class="nav-list">
                    <a class="nav-item" onclick="xjqd1('${courseClass}','${courseCode}')">新建签到</a>
                </th>
                <th class="nav-list">
                    <a class="nav-item cr" onclick="ckhz('${courseCode}','${courseClass}')">查看汇总</a>
                </th>
                <th class="nav-list">
                    <a class="nav-item cg" onclick="bjmd('${courseCode}')">班级名单</a>
                </th>
                <th class="nav-list">
                    <a class="nav-item co" onclick="showqrCode()">班级二维码</a>
                </th>
            </tr>
        </table>
    </div>
    <div class="workspace">
        <div>
            <c:forEach items="${lists}" var="course" varStatus="status">
            <div class="weui-cell weui-cell_swiped" id="swipe1">
                <div class="weui-cell__bd content">
                    <div class="list-time">
                            ${course.getAttendDate()}  ${xinqi[status.index]}
                    </div>
                    <div class="list-item">
                        <div class="item-data">
                            出勤 ${course.getAttence()} 缺勤 ${course.getAbsence()} 迟到 ${course.getLate()} 请假 ${course.getLeave()}
                        </div>
                        <div class="item-view">
                            <a  onclick="ck('${courseCode}','${course.getAttendDate()}','${courseClass}','${xinqi[status.index]}')">查看</a>
                        </div>
                    </div>
                </div>
                <div class="weui-cell__ft">
                    <a class="weui-swiped-btn weui-swiped-btn_warn delete-swipeout cent" onclick="deletelishi('${course.getAttendDate()}','${courseCode}')">删除</a>
                        <%--<a class="weui-swiped-btn weui-swiped-btn_default close-swipeout cent" href="javascript:">关闭</a>--%>
                </div>
            </div>
            </c:forEach>

        </div>
    </div>
    <!-- 底部信息栏 -->
    <form id="myselfForm" action="myself" method="post">
        <footer class="footmenu">
            <a id="classA" class="active" href="javascript:;">
                <div class="navSelf">
                    <i class="iconfont bold">
                        <img onfocus="this.blur()" id="imgClass" src="../img/common/myClass2.png"
                             style="vertical-align:middle;text-align:center">
                    </i>
                    <span>课堂</span>
                </div>
            </a>
            <a id="myselfA" onfocus="clickmyself()" onblur="unClickMyself()"
               href="javascript:document:myselfForm.submit();">
                <div class="navSelf">
                    <em class="dot red meDot hide2"></em>
                    <i class="iconfont bold">
                        <img onfocus="this.blur()" id="imgMyself" src="../img/common/myself1.png"
                             style="vertical-align:middle;text-align:center"></i>
                    <span>我的</span>
                </div>
            </a>
        </footer>
    </form>
</div>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
<script>
    $('.weui-cell_swiped').swipeout();

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

    function showqrCode() {
        $("#qrcode").removeClass("hidden");
    }

    function xiaoshiqrcode() {
        $("#qrcode").addClass("hidden");
    }

    function xjqd1(courseclass,coursecode) {
        post('/checkbegin.do',{"courseclass": courseclass,"coursecode": coursecode});
    }
    function ck(coursecode,inputtime,courseclass,xinqi) {
        post('/checkone.do',{"coursecode": coursecode,"inputtime": inputtime,"courseclass": courseclass,"xinqi":xinqi});
    }
    function bjmd(coursecode) {
        post('/classallper.do',{"coursecode": coursecode});
    }
    function deletelishi(date,coursecode) {
        $.ajax({
            type: "POST",
            url: '/deletelishi.do',
            data: {"coursecode": coursecode,"date": date},
            async: false,
            datetype: 'json',
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if(data==='true'){
                    window.location.reload();
                }
            }
        });
        // post('/deletelishi.do',{"coursecode": coursecode,"date": date,"courseclass": courseclass});
    }
    function ckhz(courseCode,courseClass) {
        post('/ckhz.do',{"courseCode": courseCode,"courseClass": courseClass});
    }
    // $(function(){
    //     // pushHistory();
    //     window.addEventListener("popstate", function(e) {
    //         alert("我监听到了浏览器的返回按钮事件啦");//根据自己的需求实现自己的功能
    //
    //         post('/teacherCourseClass',{"teacherno":"2016011087" ,"courseid":"U3M18V"});
    //     }, false);
    //
    //
    // });


</script>

</body>
</html>