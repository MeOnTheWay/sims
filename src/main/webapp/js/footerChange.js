<!-- 底部信息脚本 -->
/*点击“课堂”，颜色以及图片切换*/
function clickClass() {
    $("#classA").siblings().removeClass();
    $("#imgClass").attr("src", "../img/common/myClass2.png");
    unClickMyself();
}

/*“课堂”按钮失效，图片还原*/
function unClickClass() {
    $("#imgClass").attr("src", "../img/common/myClass1.png");

}

/*点击“我的”，颜色以及图片切换*/
function clickmyself() {
    $("#myselfA").siblings().removeClass();
    $("#imgMyself").attr("src", "../img/common/myself2.png");
}

/*“我的”按钮失效，图片还原*/
function unClickMyself() {
    $("#imgMyself").attr("src", "../img/common/myself1.png");

}

/*点击“功能”，颜色以及图片切换*/
function clickFuction() {
    $("#fuctionA").siblings().removeClass();
    $("#imgFuction").attr("src", "../img/common/fuction1.png");
    unClickMyself();
}

/*“功能”按钮失效，图片还原*/
function unClickFuction() {
    $("#imgFuction").attr("src", "../img/common/fuction2.png");

}