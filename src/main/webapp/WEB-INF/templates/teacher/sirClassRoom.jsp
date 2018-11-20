<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>选择班级</title>
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

        .nav {
            height: 4vh;
            padding-top: 1vh;
            padding-left: 4vw;
            padding-bottom: 0.5vh;
            border-bottom: 1px solid #C0C0C0;
            margin-bottom: 1vh;
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

        .workspace {
            width: 100%;
            -webkit-box-flex: 1;
            flex: 1;
            overflow: auto;
            overflow-x: hidden;
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

        .course-main-list .add {
            height: 5vh;
            text-align: center;
            color: #fff;
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

        .course-main-list li .fis {
            height: 6vh;
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
            z-index: 1;
            -webkit-tap-highlight-color: transparent;
            outline: 0;
        }

        .contentItem {
            margin-top: 1vh;
            padding: 0 2%;
            /*background-color: #48cafd;*/
        }

        .item {
            height: 10vh;
            line-height: 10vh;
            color: #383839;
            margin-bottom: 2vh;
            border-radius: 5px;
            list-style: none;
            box-shadow: 0 2px 2px rgba(0, 0, 0, .3);
            background-color: #48cafd;
            position: relative;
        }

        .item .link {
            height: 10vh;
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
            z-index: 1;
            outline: 0;
        }

        .item .list {
            height: 10vh;
            line-height: 10vh;
            float: left;
        }

        .item .number {
            width: 9vw;
            text-align: center;
            font-size: 18px;
            color: #fff;
        }

        .item .info {
            width: 44vw;
            text-align: left;
            padding-left: 1vw;
        }

        .item .info .infoNum {
            margin-top: 2vh;
            height: 4vh;
            line-height: 4vh;
            font-size: 18px;
            color: #fff;
        }

        .item .info .infoTime {
            height: 4vh;
            line-height: 4vh;
            font-size: 12px;
            color: #fff;
        }

        .item .cnum {
            width: 29vw;
        }

        .cnum .code {
            text-align: center;
            font-size: 20px;
            color: #fff;
        }

        .item .more {
            width: 12vw;
        }

        .more img {
            position: relative;
            max-width: 100%;
            margin-top: 3vh;
            height: 4vh;
            line-height: 4vh;
            z-index: 100;
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
    <div class="nav">
        <span>课程</span>
        <img src="../img/student/jiantou.png">
    </div>

    <div class="workspace">
        <div class="contentItem" id="null-div">
            <ul class="course-main-list" id="course-list">
                <li class="add">
                    <a  class="fis" onclick="addClassBefore('${courseId}')"></a>
                    <div class="addClass">
                        创建班级
                    </div>
                </li>
            </ul>

            <c:forEach items="${teacherCourseclass}" var="course" varStatus="status">
            <div class="item">
                <a class="link" onclick="toFuction('${course.courseCode}','${course.courseClass}')"></a>
                <div class="list number">${status.count}</div>
                <div class="list info">
                    <div class="infoNum">${course.courseClass}</div>
                    <div class="infoTime">${course.inputTime}</div>
                </div>
                <div class="list cnum">
                    <div class="code">
                            ${course.inviteCode}
                    </div>
                </div>
                <div class="list more">
                    <img src="../../../img/more2.png" id='show-actions' href="javascript:;" onclick="showaction('${course.courseCode}')">
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

<script src="../../../js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
<script>
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
    function toFuction(courseCode,courseClass) {
        post('/checkCourseclassall.do',{"courseCode": courseCode,"courseClass": courseClass});


    }
    function addClassBefore(courseId) {
        post('/addClassBefore',{"courseId": courseId});
    }

    function showaction(coursecode) {
        $.actions({
            title: "选择操作",
            onClose: function () {
                // console.log("close");
            },
            actions: [
                // {
                //     text: "编辑",
                //     className: "color-warning",
                //     // onClick: function () {
                //     //     $.alert("你选择了“编辑”");
                //     // }
                // },
                {
                    text: "删除",
                    className: 'color-danger',
                    onClick: function () {
                        $.ajax({
                            type: "POST",
                            url: '/deleteClassOne.do',
                            data: {"coursecode": coursecode},
                            async: false,
                            datetype: 'json',
                            error: function (request) {
                                alert("Connection error");
                            },
                            success: function (data) {
                                // console.log("22222");
                                if(data==='true'){
                                    $.alert("删除成功");
                                    window.location.reload();
                                }else{
                                    $.alert("已超过一小时，无法删除");
                                }

                            }
                        });
                    }
                }
            ]
        });
    };

    // $(function(){
    //     // pushHistory();
    //     window.addEventListener("popstate", function(e) {
    //         alert("我监听到了浏览器的返回按钮事件啦");//根据自己的需求实现自己的功能
    //         // post(,);
    //     }, false);
    //
    //
    // });



</script>
</body>
</html>