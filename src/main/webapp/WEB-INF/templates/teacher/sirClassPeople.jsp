<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>班级名单</title>
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
            border-bottom: 1px solid #C0C0C0;
            margin-bottom: 1vh;
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

        .workspace {
            width: 100%;
            -webkit-box-flex: 1;
            flex: 1;
            overflow: auto;
            overflow-x: hidden;
            padding-bottom: 52px;
        }

        .course-main-list {
            padding-top: 5px;
            padding-left: 4vw;
            border-bottom: 1px solid #999;
            opacity: 0.8;
            height: 7vh;
            background-color: #ffff;
            margin-bottom: 1vh;
            position: relative;
        }

        .touxiang {
            width: 10vw;
            height: 10vw;
            line-height: 10vw;
            float: left;
            border-radius: 5vw;
            margin-left: 10px;
            margin-top: 0.5vh;
        }

        .course-main-list .data {
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
<div class="page-inner" id="page-main-view">
    <div class="nTitle">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
        <span>班级</span>
        <img src="../img/student/jiantou.png">
        <span>${courseClass}</span>
        <img src="../img/student/jiantou.png">
        <span>班级名单</span>
    </div>

    <div class="workspace">
        <div id="host-box">
            <div class="content" id="null-div">
                <c:forEach items="${courseinfos}" var="chuqin" varStatus="status">

                <div class="course-main-list" id="course-list">
                    <img src="../img/student/touxiang.jpg" class="touxiang">
                    <div class="data">
                        <span>${chuqin.getStudentName()}</span>
                        <span class="num">${chuqin.getStudentNo()}</span>
                    </div>
                </div>
                </c:forEach>

            </div>
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

</script>

</body>
</html>