<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico" />
    <link href="css/zanzhu.css" type="text/css" rel="stylesheet" />
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <div class="class2">
            <img src="images/zanzhu1.jpg" width="33%" height="66%"> <img
                src="images/zanzhu2.jpg" width="33%" height="66%"> <img
                src="images/zanzhu3.jpg" width="33%" height="66%">
        </div>
        <div class="class1">
            <marquee direction="up"
                     onmouseup="this.scrollAmount='2';this.direction='up'"
                     scrollamount="2" height="250" width="1050">
                <p style="text-align: center;">
                    燕双嘤赞助100元<br>杜马赞助50元<br>步鹰赞助60元<br>云建民赞助30元
                </p>
            </marquee>
        </div>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>

</html>