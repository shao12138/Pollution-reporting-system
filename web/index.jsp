<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <link href="css/shouye.css" type="text/css" rel="stylesheet"/>
    <script>
        function zhuce() {
            location.href = 'zhuce.jsp';
        }

        function zanzhu() {
            location.href = 'zanzhu.jsp';
        }
    </script>
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <c:if var="login" test="${empty sessionScope.user }">
            <form action="login" name="form1" method="post">
                <fieldset>
                    <legend style="color: green; font-weight: bold;">请登录</legend>
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="color: green; font-weight: bold; font-size: 20px;">账号:</td>
                            <td><input type="text" name="number" style="width: 300px; height: 30px;"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="color: green; font-weight: bold; font-size: 20px;">密码:</td>
                            <td><input type="password" name="password" style="width: 300px; height: 30px;"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <th></th>
                            <th><input type="button" value="注册" onclick="zhuce()"
                                       style="width: 80px; height: 30px; color: blue; font-weight: bold; font-size: 20px; opacity: 0.7;">
                                <input
                                        type="submit" value="登录"
                                        style="width: 80px; height: 30px; color: blue; font-weight: bold; font-size: 20px; opacity: 0.7;">&nbsp;&nbsp;&nbsp;
                            </th>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </c:if>
        <c:if test="${!login }">
            <fieldset class="fff">
                <br> <a href="gerenxinxi.jsp"> <span>${sessionScope.user.name}</span>&nbsp;&nbsp;&nbsp;欢迎
                登录
            </a>
            </fieldset>
        </c:if>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>
</html>