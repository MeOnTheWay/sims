<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>签到详情</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">--%>
    <meta name="viewport"
          content="width=device-width, minimum-scale=1.0,initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
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

        .nav {
            height: 4vh;
            padding-top: 1vh;
            padding-left: 4vw;
            padding-bottom: 0.5vh;
            border-bottom: 1px solid #C0C0C0;
            margin-bottom: 1vh;
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

        .sign-data {
            /*border: 1px solid red;*/
            height: 4vh;
            line-height: 4vh;
        }

        .sign-data .sign-time {
            /*border: 1px solid green;*/
            margin-left: 4vw;
            width: 96vw;
            float: left;
            font-size: 13px;
            color: #373d41;
        }

        .left {
            position: relative;
            width: 100vw;
            /*height: 80vh;*/
            /*overflow: hidden;*/
            /*margin-bottom: 2px;*/
        }

        ol {
            /*position: absolute;*/
            z-index: 100;
            /*left: 0;*/
            width: 100vw;
            margin-left: 0.2vw;
            margin-top: 0.5vh;
            height: 6vh;
        }

        ol li {
            border-top: 1px solid #C0C0C0;
            border-bottom: 1px solid #C0C0C0;
            border-left: 1px solid #C0C0C0;
            border-right: none;
            text-align: center;
            background: #fafafa;
            color: #04BE02;
            width: 24.5vw;
            height: 6vh;
            line-height: 6vh;
            float: left;
        }

        ol .borderLine {
            position: relative;
            width: 20.5vw;
            border-top: 2px solid #04BE02;
            top: 6vh;
            left: 2.2vw;
        }

        .rightBorder {
            border-right: 1px solid #C0C0C0;
        }

        ul {
            position: relative;
            width: 100%;
            height: 80vh;
            overflow: hidden;
        }

        ul li {
            /*margin-left: 4vw;*/
            width: 100vw;
            position: absolute;
            color: white;
            left: 100vw;
            top: 1vh;
            /*opacity: 0;*/
            /*border: 1px solid red;*/
        }

        .people {
            margin-left: 4vw;
            /*border-bottom: 1px solid #999;*/
            margin-bottom: 0.5vh;
            font-size: 15px;
            color: #373d41;
        }

        .top {
            z-index: 99;
        }

        .item {
            /*height: 80vh;*/
            width: 100vw;
            /*overflow: auto;*/
            /*overflow-x: hidden;*/
            overflow-y: auto;
            /*border: 1px solid green;*/
            height: 68vh;
            z-index: 999;
        }

        .item-list {
            /*border: 1px solid red;*/
            padding-top: 5px;
            padding-left: 4vw;
            border-bottom: .5px solid #999;
            opacity: 0.8;
            height: 7vh;
            background-color: #ffff;
            margin-bottom: 1vh;
            position: relative;
        }

        .touxiang {
            width: 5vh;
            height: 5vh;
            float: left;
            border-radius: 2.5vh;
            margin-left: 10px;
            margin-top: 1vh;
        }

        .item-list .data {
            margin-top: 2vh;
            position: absolute;
            left: 16vw;
            top: 0;
            margin-left: 3vw;
        }

        .data span {
            font-size: 15px;
            color: #373d41;
        }

        .data .num {
            position: absolute;
            left: 23vw;
            top: 0;
        }

        .item-list .status {
            display: block;
            font-size: 15px;
            color: #373d41;
            float: right;
            width: 10vw;
            margin-top: 1.5vh;
            margin-right: 10vw;
        }

        ::-webkit-scrollbar {
            width: 0; /* 滚动条宽度为0 */
            height: 0; /* 滚动条高度为0 */
            display: none; /* 滚动条隐藏 */
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

        /*.show {*/
        /*display: block;*/
        /*}*/
    </style>
</head>
<body>
<div class="page-inner">

    <div class="nav">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
        <span>班级</span>
        <img src="../img/student/jiantou.png">

        <%--获取小班的名字尽量在10个字之内--%>
        <span>${courseclass}</span>

        <img src="../img/student/jiantou.png">
        <span>签到详情</span>
    </div>
    <div class="sign-data">
        <div class="sign-time">
            2018-10-21 15:52:16 星期六
        </div>
    </div>


    <div class='left'>
        <ol>
            <li style="background: #f1f1f1">出勤</li>
            <li>迟到</li>
            <li>缺勤</li>
            <li id="lw" class="rightBorder">请假</li>
            <div id="borderLine" class="borderLine"></div>
        </ol>

        <!-- ul和ol下的li数量一致 -->
        <ul class='banner'>
            <li style='left:0;'>
                <div class="people">
                    出勤共<span>50</span>人
                </div>
                <div class="item">
                    <%--<c:forEach items="${chuqins}" var="chuqin" varStatus="status">--%>
                    <div class="item-list">
                        <img src="../img/student/touxiang.jpg" class="touxiang">
                        <div class="data">
                            <span>${chuqin.keySet()}李明林</span>
                            <span class="num">${chuqin.values}2016011228</span>
                        </div>
                        <input type="text" class="status" value="出勤" id="9527">
                    </div>

                    <%--</c:forEach>--%>
                </div>
            </li>
            <li>
                <div class="people">
                    迟到共<span>30</span>人
                </div>
                <div class="item">
                    <%--<c:forEach items="${chuqins}" var="chuqin" varStatus="status">--%>
                    <div class="item-list">
                        <img src="../img/student/touxiang.jpg" class="touxiang" alt="">
                        <div class="data">
                            <span>${chuqin.keySet()}李明林</span>
                            <span class="num">${chuqin.values}2016011228</span>
                        </div>
                        <input type="text" class="status" value="迟到">
                    </div>
                    <%--</c:forEach>--%>
                </div>
            </li>
            <li>
                <div class="people">
                    缺勤共<span>20</span>人
                </div>
                <div>
                    <%--<c:forEach items="${chuqins}" var="chuqin" varStatus="status">--%>
                    <div class="item-list">
                        <img src="../img/student/touxiang.jpg" class="touxiang" alt="">
                        <div class="data">
                            <span>${chuqin.keySet()}李明林</span>
                            <span class="num">${chuqin.values}2016011228</span>
                        </div>
                        <input type="text" class="status" value="缺勤">
                    </div>
                    <%--</c:forEach>--%>
                </div>
            </li>
            <li>
                <div class="people">
                    请假共<span>10</span>人
                </div>
                <div class="item">
                    <%--<c:forEach items="${chuqins}" var="chuqin" varStatus="status">--%>
                    <div class="item-list">
                        <img src="../img/student/touxiang.jpg" class="touxiang" alt="">
                        <div class="data">
                            <span>${chuqin.keySet()}李明林</span>
                            <span class="num">${chuqin.values}2016011228</span>
                        </div>
                        <input type="text" class="status" value="请假">
                    </div>
                    <%--</c:forEach>--%>
                </div>
            </li>
        </ul>

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

    $(document).ready(function () {
        (function () {
            // 左右滑动 leftright()
            function lr() {
                var num = 0;
                var asd = 0;
                var w = document.body.offsetWidth;
                var move = w * 0.022;

                function change() {
                    $("input").select("close");
                    $('.left ul li').eq(num).animate({left: '0px'}, 400).addClass('top');
                    $('.left ul li').eq(asd).animate({left: '-100vw'}, 400, function () {
                        $(this).css('left', '100vw')
                    }).removeClass('top');

                    $('.left ol li').css('background', '#fafafa');
                    $('.left ol li').eq(num).css('background', '#f1f1f1');
                    move += (num - asd) * w * 0.245 + (num - asd) * 1;
                    $('#borderLine').animate({
                        left: move + 'px'
                    }, 200);
                };
                $('.left ol li').click(function () {
                    $("input").select("close");
                    asd = num;
                    num = $(this).index();
                    if (num < asd) {
                        $('.left ul li').eq(num).css('left', '-100vw');
                        $('.left ul li').eq(asd).animate({left: '100vw'}, 400).removeClass('top');
                        $('.left ul li').eq(num).animate({left: '0'}, 400).addClass('top');

                        $('.left ol li').css('background', '#fafafa');
                        $('.left ol li').eq(num).css('background', '#f1f1f1');
                        move -= (asd - num) * w * 0.245 + (asd - num) * 1;
                        $('#borderLine').animate({
                            left: move + 'px'
                        }, 200);
                    } else if (num == asd) {
                        return false;
                    } else {
                        change();
                    }
                    ;
                });
            };
            lr();
        })();
    });

    $("input").select({
        title: "签到状态",
        items: [
            {
                title: "出勤",
                value: "出勤"
            },
            {
                title: "迟到",
                value: "迟到"
            },
            {
                title: "缺勤",
                value: "缺勤"
            },
            {
                title: "请假",
                value: "请假"
            }
        ],
        onOpen: function (d) {
            console.log(d.data.values);
        },
        onClose: function (d) {
            console.log(d.data.values);
        }
    });

</script>

</body>
</html>