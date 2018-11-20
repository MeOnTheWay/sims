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

        .page-inner {
            display: flex;
            flex-direction: column;
            height: 100%;
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
<body onload="toFocusClassA()">
<div class="page-inner">

    <div class="workspace">
        <div id="host-box">
            <div class="content" id="null-div">
                <%--占位--%>
                <div class="ktcon1r"></div>
                <ul class="course-main-list" id="course-list">
                    <li class="add">
                        <a class="fis" onclick="addCoursebefore('${teacherno}')"></a>
                        <div class="addClass">
                            创建课程
                        </div>
                    </li>
                </ul>
                <c:forEach items="${courseList}" var="course" varStatus="status">
                    <ul class="course-main-list" id="course-list">
                        <li>
                            <a onclick="toSmallClass('${course.teacherNo}','${course.courseId}',courseName${status.index})" class="link"></a>
                            <div class="title">
                                <h3 id="courseName${status.index}">${course.courseName}</h3>
                                <img src="../../../img/topic/updateTopic.png" id='show-actions${status.index}' href="javascript:;" onclick="showaction('${course.courseId}')">
                            </div>
                            <p>创建时间：${course.inputTime}</p>
                        </li>
                    </ul>
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

<script src="../../../js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
<!-- 导入JQuery包 -->
<script>

    /*页面加载的时候，“课堂”按钮默认获焦*/
    function toFocusClassA() {
        $("#classA").focus();
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

    function toSmallClass(teacherno,courseid,idif) {
        if($(idif).html()==='形式与政策'){
           post('/checkCourseclassallxingshi.do',{"courseId":courseid})
        }else{
            post('/teacherCourseClass',{"teacherno": teacherno,"courseid":courseid});
        }
    }
    function addCoursebefore(teacherno) {
        post('/addCourseBefore',{"teacherno": teacherno});
    }
    function toFocusClassA() {
        $("#classA").focus();
    }



    function showaction(courseid) {

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
                        // $.alert("你选择了“删除”");
                        $.ajax({
                            type: "POST",
                            url: '/deleteCourseOne.do',
                            data: {"courseid": courseid},
                            async: false,
                            datetype: 'json',
                            error: function (request) {
                                alert("Connection error");
                            },
                            success: function (data) {
                                console.log("22222")
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
</script>

</body>
</html>