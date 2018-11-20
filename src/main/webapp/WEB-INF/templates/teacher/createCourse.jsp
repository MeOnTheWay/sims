<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>添加课程</title>
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

        .absolute {
            width: 100%;
            -webkit-box-flex: 1;
            flex: 1;
            overflow: auto;
            overflow-x: hidden;
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
        <span>添加课程</span>
    </div>
    <%--表单post提交--%>
    <form id="confirmUpdateClassForm" action="/addCourse" method="post">

        <div class="absolute">

            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">课程学年</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="xuenian" type="text" id='academicYear'/>
                    </div>
                </div>
            </div>

            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">课程学期</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="xueqi" type="text" id='semester'/>
                    </div>
                </div>
            </div>

            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">课程名称</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="coursename" type="text" placeholder="如：数据结构">
                    </div>
                </div>
            </div>
            <div class="weui-cells__tips">课程名称请简洁明了</div>
            <button id="submitFrom" name="teacherno" value='${teacherno}' class="weui-btn weui-btn_plain-default" style="margin-top: 5vh;width: 92vw;">添加
            </button>
        </div>
    </form>
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

</div>
<script src="../../../js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
<script>
    submitFrom.onclick = function () {
        console.log("保存成功");
    };

    $("#academicYear").picker({
        title: "选择学年",
        cols: [
            {
                textAlign: 'center',
                values: [
                    '2018-2019',
                    '2019-2020',
                    '2021-2022',
                    '2023-2024',
                    '2025-2026',
                    '2027-2028'
                ]
            }
        ]
    });
    $("#semester").picker({
        title: "选择学期",
        cols: [
            {
                textAlign: 'center',
                values: [
                    '第1学期',
                    '第2学期'
                ]
            }
        ]
    });
</script>
</body>
</html>
