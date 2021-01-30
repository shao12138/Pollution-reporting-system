<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id=Tdiv
     style="HEIGHT: 45px; LEFT: 10px; POSITION: absolute; TOP: 200px; WIDTH: 120px; Z-INDEX: 25;">
    <a href="zhuce.jsp"> <input name="image1" type="image"
                                id="image1" src="s/szhuce.png" width="100" height="50 "
                                style="border: 1px solid #54f1d6;"/></a>
    <a href="gerenxinxi.jsp"> <input name="image1" type="image"
                                     id="image1" src="s/sgerenxinxi.png" width="100" height="50 "
                                     style="border: 1px solid #54f1d6;"/></a>
    <a href="back-login.jsp"> <input name="image1" type="image"
                                id="image1" src="s/shoutai.png" width="100" height="50 "
                                style="border: 1px solid #54f1d6;"/></a>
</div>
<script>
    var ImgW = parseInt(image1.width); //获得图片的宽度
    function permute(tfloor, Top, left) { //left为移动目标与右边框的距离，top为移动目标与上边框的距离
        var RealTop = parseInt(document.body.scrollTop); //得到滑轮的高度
        var buyTop = Top + RealTop; //定义即将调整后的高度
        document.all[tfloor].style.top = buyTop + 500; //设置指定容器的高度
        var buyLeft = parseInt(document.body.scrollLeft)
            + parseInt(document.body.clientWidth) - ImgW; //定义即将移动目标的水平位置
        document.all[tfloor].style.left = 1800; //设置指定容器的水平位置
    }

    setInterval('permute("Tdiv",2,2)', 1); //间隔时间内调用permute函数，时间为1ms。
</script>
</body>
</html>
