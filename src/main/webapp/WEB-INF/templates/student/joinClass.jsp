<%--
  User: Jiang Jiahong
  Date: 2018/1/5
  Time: 13:54
  Description:“学生”板块 —— 加入班级
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="../../../js/jquery-3.2.1.min.js"></script>
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

        header .button {
            min-width: 50px;
            line-height: 26px;
            border: 1px solid #979797;
            color: #fff;
            background-color: rgba(250, 250, 250, .2);
            border-radius: 3px;
            margin-right: 15px;
            padding: 1px 10px;
            display: inline-block;
            position: relative;
            text-align: center;
            font-size: 14px;
            -webkit-appearance: none;
            -webkit-tap-highlight-color: transparent;
            outline: 0;
        }

        .absolute {
            width: 100%;
            -webkit-box-flex: 1;
            flex: 1;
            overflow: auto;
            overflow-x: hidden;
        }

        .weui_cells {
            margin-top: 1.17647059em;
            background-color: #FFF;
            line-height: 1.41176471;
            font-size: 17px;
            overflow: hidden;
            position: relative;
        }

        .weui_cells:after, .weui_cells:before {
            position: absolute;
            left: 0;
            width: 100%;
            height: 1px;
            color: #D9D9D9;
            content: " ";
        }

        .weui_cells:before {
            transform: scaleY(.5);
            position: absolute;
            left: 0;
            width: 100%;
            height: 1px;
            color: #D9D9D9;
            content: " ";
            bottom: 0;
            border-bottom: 1px solid #D9D9D9;
            transform-origin: 0 100%;
        }

        .weui_cell {
            padding: 2% 15px;
            line-height: 2.3;
            position: relative;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
        }

        .weui_cell:first-child:before {
            display: none;
        }

        .weui_cell:before {
            content: " ";
            position: absolute;
            width: 100%;
            height: 1px;
            color: #D9D9D9;
            transform-origin: 0 0;
            transform: scaleY(.5);
            left: 15px;
        }

        .weui_cell:before, .weui_cells:before {
            top: 0;
            border-top: 1px solid #D9D9D9;
            -webkit-transform: scaleY(.5);
            -ms-transform: scaleY(.5);
        }

        .weui_cell_primary {
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            -ms-flex: 1;
            flex: 1;
        }

        .weui_input {
            width: 100%;
            background-color: transparent;
            font-size: inherit;
            height: 1.41176471em;
            line-height: 1.41176471;
            border: 0;
            color: inherit;
            outline: 0;
        }

        .weui_input, input, select, textarea {
            -webkit-appearance: none;
        }

        p {
            margin-left: 4vw;
            margin-top: 1vh;
            color: #373d41;
            font-size: 12px;
        }
    </style>
</head>
<body>

<div class="page-inner" id="page-1510890771684">
    <%--<form id="attendCourseForm" action="confirmAttendCourse" method="post">--%>
        <header class="header-item" style="background-color:#464646">
            <%--返回按钮--%>
            <%--javascript:history.back(-1);--%>
            <a href="javascript:history.back(-1)" class="icon-back" id="backClass">
                <img src="../img/common/backWhite.png">
            </a>
            <h2 class="text-overflow">加入班级</h2>
            <%--表单提交--%>
            <input type="submit" class="button" id="submitFrom" value="添加" onclick="queren(document.getElementById('invitecode'),'${studentno}')">
        </header>
        <div class="absolute">
            <div class="weui_cells">
                <div class="weui_cell">
                    <div class="weui_cell_primary">
                        <input class="weui_input" id="invitecode" type="text" name="cname" placeholder="输入邀请码"
                               value="${course.cname}" autofocus="autofocus">
                    </div>
                </div>
            </div>
        </div>
        <p>通过输入6位邀请码加入班级</p>
    <%--</form>--%>
</div>

<%--提示框--%>


<script>
    setTimeout('$("#tipWindow").addClass("hidden")', 2000);
</script>

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
    function queren(invitecode1,studentno){
        var invitecode=invitecode1.value;
        // alert(invitecode);
        $.ajax({
            type: "POST",
            url: '/inviteLast.do',
            data: {"invitecode":invitecode},
            async: false,
            datetype: 'json',
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if(data==='true'){
                    alert("成功");
                    post("/stuclass.do",{"studentno":studentno})
                }else{
                    alert("失败");
                }

            }
        });

    }

</script>
</html>