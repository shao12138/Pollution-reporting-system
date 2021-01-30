<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico" />
    <link href="css/chanpin.css" type="text/css" rel="stylesheet" />
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <img src="images/chanpin.jpg" width="1050" height="755"/>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>

</html>