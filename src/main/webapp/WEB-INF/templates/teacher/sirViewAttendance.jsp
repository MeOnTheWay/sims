<%--
  User: Jiang Jiahong
  Date: 2018/1/5
  Time: 15:52
  Description: 教师 班级查看签到
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
    <link type="text/css" href="../css/common/common-9baddc8954.css" rel="stylesheet">
    <link href="../css/common/layer.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/footerChange.js"></script>
    <style type="text/css">
        body {
            position: relative;
            max-width: 520px;
            margin: 0 auto;
            padding: 0;
            overflow: hidden;
        }
        .view{
            height: 500px;
        }
        .people{
            padding-left: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #999;
            margin-bottom: 5px;
            font-size: 15px;
        }
        .item{
        }
        .item-list{
            padding-top: 5px;
            border-bottom: 1px solid #999;
            opacity: 0.8;
            height: 70px;
        }
        .touxiang{
            width: 50px;
            height: 50px;
            float: left;
            border-radius: 25px;
            margin-left: 10px;
        }
        .item-list .data{
            float: left;
            margin-left: 10px;
        }
        .item-list .name{
            float: left;
            padding: 5px 0 10px 0;
        }
        .item-list .number{
        }
        .item-list .status{
            float: right;
            margin-top: 20px;
            margin-right: 60px;
        }
    </style>
</head>
<body style="background-color: rgb(236, 236, 236);">
<div class="view">
    <div class="people">
        出勤共50人
    </div>
    <div class="item">
        <c:forEach items="${courseinfos}" var="chuqin" varStatus="status">
        <div class="item-list">
            <img src="../img/student/touxiang.jpg" class="touxiang" alt="">
            <div class="data">
                <div class="name">${chuqin.getStudentNo()}</div>
                <div class="number">${chuqin.getStudentName()}</div>
            </div>
        </div>
        </c:forEach>

    </div>
</div>
</body>
</html>