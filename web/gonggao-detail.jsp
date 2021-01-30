<%@page import="java.sql.ResultSet"%>
<%@ page import="Test.Pojo.Notice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>河流污染查看系统</title>
    <link rel="shortcut icon" href="img/title.ico" />
    <link href="css/gonggao2.css" type="text/css" rel="stylesheet" />
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <%
            String id = request.getParameter("id");
            Notice a = ((ArrayList<Notice>) session.getAttribute("noticeDate")).get(Integer.parseInt(id));
        %>
        <div class="main">
            <div class="title">
                <h2><%=a.getTitle()%></h2>
            </div>
            <div class="qwq">
                <p style="text-indent: 2em;">
                    <%=a.getContent()%>
                </p>
            </div>
        </div>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>
</html>