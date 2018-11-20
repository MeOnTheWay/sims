<%--
  User: Jiang Jiahong
  Date: 2018/1/5
  Time: 13:10
  Description: “学生”板块 —— 课堂 首页
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
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>

    <style type="text/css">
        /*body {*/
        /*position: relative;*/
        /*max-width: 520px;*/
        /*margin: 0 auto;*/
        /*overflow: hidden;*/
        /*}*/

        /*.course {*/
        /*padding-top: 10px;*/
        /*height: auto;*/
        /*overflow: auto;*/
        /*}*/

        /*::-webkit-scrollbar {*/
        /*width: 0;   !* 滚动条宽度为0 *!*/
        /*height: 0; !* 滚动条高度为0 *!*/
        /*display: none; !* 滚动条隐藏 *!*/
        /*}*/

        /*.lesson {*/
        /*width: 90vw;*/
        /*height: auto;*/
        /*margin-left: 5vw;*/
        /*margin-top: 3vh;*/
        /*position: relative;*/
        /*border: 1px solid #888;*/

        /*}*/

        /*.lessonName {*/
        /*padding: 15px 0 15px 5px;*/
        /*font-size: 14px;*/
        /*color: #fff;*/
        /*background: #FF7F50;*/
        /*}*/

        /*.nextImg {*/
        /*float: right;*/
        /*width: 20px;*/
        /*height: auto;*/
        /*position: absolute;*/
        /*right: 5px;*/
        /*top: 15px;*/
        /*}*/
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
        }

        header {
            background-color: #464646;
            line-height: 7.5vh;
            width: 100%;
            color: #fff;
            display: flex;
            -webkit-box-align: center;
            position: relative;
            height: 7.5vh;
        }

        header h2 {
            font-size: 19px;
            font-weight: 400;
            padding-left: 5%;
            -webkit-box-flex: 8;
            flex: 8;
        }

        .c-btn {
            padding-right: 10px;
            color: #fff;
            text-align: right;
            display: block;
            -webkit-tap-highlight-color: transparent;
            outline: 0;
            text-decoration: none;
            font-size: 19px;
        }

        .workspace {
            width: 100%;
            -webkit-box-flex: 1;
            flex: 1;
            overflow: auto;
            overflow-x: hidden;
        }

        .ktcon1r {
            height: 16px;
            line-height: 16px;
            margin-left: 10px;
        }

        .course-main-list {
            padding: 0 2%;
        }

        .course-main-list li {
            /*border: 1px solid red;*/
            height: 12vh;
            padding: 1vh 4vw 0;
            background-size: cover;
            box-shadow: 0 2px 2px rgba(0, 0, 0, .3);
            margin-bottom: 2vh;
            border-radius: 5px;
            position: relative;
            list-style: none;
            background-color: #48cafd;
        }

        .course-main-list li .link {
            height: 13vh;
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
            z-index: 1;
            -webkit-tap-highlight-color: transparent;
            outline: 0;
            /*background-color: black;*/
        }

        .course-main-list li .title {
            display: -webkit-box;
            margin-top: 2vh;
            zoom: 1;
            /*border: 1px solid green;*/
        }

        .course-main-list li .title h3 {
            height: 4vh;
            line-height: 4vh;
            font-size: 17px;
            font-weight: 400;
            color: #fff;
            box-sizing: border-box;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            -webkit-box-flex: 1;
        }

        .course-main-list li img {
            position: relative;
            width: auto;
            height: 4vh;
            top: 1vh;
            /*background-color: green;*/
            z-index: 100;
        }

        .course-main-list li p {
            margin-top: 1vh;
            color: #fff;
            font-size: 14px;
        }

        footer {
            width: 100%;
            height: 60px;
            border-top: 1px solid #c8c8c8;
            display: -webkit-box;
            letter-spacing: 0;
            background: #fff;
            font-size: 13px;
            overflow: hidden;
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
            max-width: 100%;
        }

        footer span {
            display: block;
            margin-top: 2px;
        }
    </style>
</head>
<body>

<div class="page-inner">
    <header>
        <h2>微信签到</h2>
        <a href="/inviteStu" class="c-btn">加入班级</a>
    </header>

    <div class="workspace">
        <%--<div class="course">--%>
        <%--<c:forEach items="${stuclassall}" var="stuclass" varStatus="status">--%>
        <%--<div class="lesson" onclick="stucheck('${stuclass.getTeacherno()}','${stuclass.getCoursename()}')">--%>
        <%--<p class="lessonName">${stuclass.getCoursename()}</p>--%>
        <%--<img src="../img/student/jiantou.png" class="nextImg">--%>
        <%--</div>--%>
        <%--</c:forEach>--%>
        <%--</div>--%>
        <div id="host-box">
            <div class="content" id="null-div">
                <%--占位--%>
                <div class="ktcon1r"></div>
               <c:forEach items="${stuclassall}" var="stuclass" varStatus="status">
                <ul class="course-main-list" id="course-list" >
                    <li>
                        <a class="link" onclick="stucheck('${stuclass.getTeacherNo()}','${stuclass.getCourseName()}','${stuclass.getCourseCode()}')"></a>
                        <div class="title">
                            <h3>${stuclass.getCourseName()}</h3>
                            <img src="../img/student/jiantou2.png" id='show-actions' href="javascript:;">
                        </div>
                        <%--<p>老师：李信本</p>--%>
                    </li>
                </ul>
               </c:forEach>
            </div>
        </div>
    </div>

    <!-- 底部信息栏 -->
    <form id="myselfForm" action="myself" method="post">
        <footer class="fs24 footmenu">
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
</div>

</body>

<script type="text/javascript">
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
    function stucheck(teacherno,coursename,coursecode) {
        $.ajax({
            type: "POST",
            url: '/checkIf.do',
            data: {"coursecode":coursecode},
            async: false,
            datetype: 'json',
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if(data==='true'){
                    post("/stucheck.do",{"teacherno":teacherno,"coursename":coursename,"coursecode":coursecode})
                }else if (data==='false'){
                    $.alert("该课程签到以结束或未开启");
                }else if(data==='already') {
                    $.alert("您以签到，请勿重复签到");
                }

            }
        });
    }
</script>
</html>