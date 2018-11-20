<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>添加班级</title>
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

        p {
            margin-left: 4vw;
            margin-top: 1vh;
            color: #373d41;
            font-size: 12px;
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

<div class="page-inner">
    <div class="nTitle">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
        <span>${courseName}</span>
        <img src="../img/student/jiantou.png">
        <span>加入班级</span>
    </div>
    <form id="confirmUpdateClassForm" action="/addClassInfo" method="post">
    <div class="weui-cells weui-cells_form" style="margin-top: 2vh">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">班级名称</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" name="courseClass" placeholder="软：数据结构软工161班">
            </div>
        </div>
    </div>
    <div class="weui-cells weui-cells_form" style="margin-top: 2vh">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">班级描述</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" name="miaoShu" placeholder="如：软工161班分组">
            </div>
        </div>
    </div>
    <input class="weui_input fs32 " type="text" name="teacherNo" value='${teacherno}' autofocus="autofocus" style="display: none">
    <input class="weui_input fs32 " type="text" name="courseId" value='${courseId}' autofocus="autofocus" style="display: none">

    <button class="weui-btn weui-btn_plain-default" style="margin-top: 5vh;width: 92vw;">添加</button>
    </form>
</div>

<!-- 底部信息栏 -->
<form id="myselfForm" action="myself" method="post">
    <footer class="footmenu">
        <a id="classA" onfocus="clickClass()" onblur="unClickClass()" class="active" href="javascript:;">
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

</body>
</html>