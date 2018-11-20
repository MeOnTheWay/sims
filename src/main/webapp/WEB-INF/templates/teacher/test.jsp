<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"> </script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>


</head>
<body>
<h3>欢迎来到微信jsapi测试界面-V型知识库</h3>
<p>基础接口之判断当前客户端是否支持指定的js接口</p>
<input type="button" value="checkJSAPI" id="checkJsApi"><br>

<span class="desc" style="color: red">地理位置接口-使用微信内置地图查看位置接口</span><br>
<button class="btn btn_primary" id="openLocation">openLocation</button><br>
<span class="desc" style="color: red">地理位置接口-获取地理位置接口</span><br>
<button class="btn btn_primary" id="getLocation">getLocation</button><br>

<div style="display: none;">
    <span class="desc" style="color: red">获取网络状态接口</span><br>
    <button class="btn btn_primary" id="getNetworkType">getNetworkType</button><br>
    <h3 id="menu-image">图像接口</h3>
    <span class="desc">拍照或从手机相册中选图接口</span><br>
    <button class="btn btn_primary" id="chooseImage">chooseImage</button><br>
    <span class="desc">预览图片接口</span><br>
    <button class="btn btn_primary" id="previewImage">previewImage</button><br>
    <span class="desc">上传图片接口</span><br>
    <button class="btn btn_primary" id="uploadImage">uploadImage</button><br>
    <span class="desc">下载图片接口</span><br>
    <button class="btn btn_primary" id="downloadImage">downloadImage</button><br>

    <br>
    显示图片<img alt="" src="" id="faceImg">
</div>


<script type="text/javascript">
    wx.config({
        debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: '${appId}', // 必填，公众号的唯一标识
        timestamp: '${ timestamp}' , // 必填，生成签名的时间戳
        nonceStr: '${ nonceStr}', // 必填，生成签名的随机串
        signature: '${ signature}',// 必填，签名，见附录1
        jsApiList: ['checkJsApi',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',//网络状态接口
            'openLocation',//使用微信内置地图查看地理位置接口
            'getLocation' //获取地理位置接口
        ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    wx.ready(function(){
        // 5 图片接口
        // 5.1 拍照、本地选图
        var images = {
            localId: [],
            serverId: []
        };
        document.querySelector('#chooseImage').onclick = function () {
            wx.chooseImage({
                success: function (res) {
                    images.localId = res.localIds;
                    alert('已选择 ' + res.localIds.length + ' 张图片');
                    $("#faceImg").attr("src", res.localIds[0]);//显示图片到页面上
                }
            });
        };

        // 5.2 图片预览
        document.querySelector('#previewImage').onclick = function () {
            wx.previewImage({
                current: 'https://www.vxzsk.com/upload//bf04c9b5-5699-421d-900e-3b68bbe58a8920160816.jpg',
                urls: [
                    'https://www.vxzsk.com/upload//bf04c9b5-5699-421d-900e-3b68bbe58a8920160816.jpg',
                    'https://www.vxzsk.com/upload//bf04c9b5-5699-421d-900e-3b68bbe58a8920160816.jpg',
                    'https://www.vxzsk.com/upload//bf04c9b5-5699-421d-900e-3b68bbe58a8920160816.jpg'
                ]
            });
        };

        // 5.3 上传图片
        document.querySelector('#uploadImage').onclick = function () {
            if (images.localId.length == 0) {
                alert('请先使用 chooseImage 接口选择图片');
                return;
            }
            var i = 0, length = images.localId.length;
            images.serverId = [];
            function upload() {
                wx.uploadImage({
                    localId: images.localId[i],
                    success: function (res) {
                        i++;
                        //alert('已上传：' + i + '/' + length);
                        images.serverId.push(res.serverId);
                        if (i < length) {
                            upload();
                        }
                    },
                    fail: function (res) {
                        alert(JSON.stringify(res));
                    }
                });
            }
            upload();
        };

        // 5.4 下载图片
        document.querySelector('#downloadImage').onclick = function () {
            if (images.serverId.length === 0) {
                alert('请先使用 uploadImage 上传图片');
                return;
            }
            var i = 0, length = images.serverId.length;
            images.localId = [];
            function download() {
                wx.downloadImage({
                    serverId: images.serverId[i],
                    success: function (res) {
                        i++;
                        alert('已下载：' + i + '/' + length);
                        images.localId.push(res.localId);
                        if (i < length) {
                            download();
                        }
                    }
                });
            }
            download();
        };

        // 6 设备信息接口
        // 6.1 获取当前网络状态
        document.querySelector('#getNetworkType').onclick = function () {
            wx.getNetworkType({
                success: function (res) {
                    alert(res.networkType);
                },
                fail: function (res) {
                    alert(JSON.stringify(res));
                }
            });
        };
        //网络接口结束

        // 7 地理位置接口 开始
        // 7.1 查看地理位置
        document.querySelector('#openLocation').onclick = function () {
            wx.openLocation({
                latitude: 23.099994,
                longitude: 113.324520,
                name: 'TIT 创意园',
                address: '广州市海珠区新港中路 397 号',
                scale: 14,
                infoUrl: 'http://weixin.qq.com'
            });
        };

        // 7.2 获取当前地理位置
        document.querySelector('#getLocation').onclick = function () {
            wx.getLocation({
                success: function (res) {
                    alert(JSON.stringify(res));
                },
                cancel: function (res) {
                    alert('用户拒绝授权获取地理位置');
                }
            });
        };
        // 7 地理位置接口 结束

    });
    //初始化jsapi接口 状态
    wx.error(function (res) {
        alert("调用微信jsapi返回的状态:"+res.errMsg);
    });

</script>

</body>
</html>