<%@page import="java.sql.ResultSet" %>
<%@ page import="Test.Pojo.Notice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>河流污染举报系统后台</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <link rel="stylesheet" type="text/css" href="ss.css"/>
    <link rel="stylesheet" type="text/css" href="css/shouye3.css"/>
</head>
<body>
<div id="mainDiv">
    <div id="topDiv">
        <div id="tmenu">
            <span style="font-size: 30px; color: yellow;">金水河污染举报系统后台管理-公告修改</span>
        </div>
    </div>
    <%
        String id = request.getParameter("id");
        Notice a = ((ArrayList<Notice>) session.getAttribute("noticeDate")).get(Integer.parseInt(id));
    %>
    <div id="centerDiv">
        <jsp:include page="part/back_navigation.jsp"/>
        <div id="right">
            <center>
                <br> <br> <br>
                <form action="back_notice_edit" id="info" method="post">
                    <label style="font-size: 25px">标题：</label>
                    <input type="text" name="tit" value="<%=a.getTitle()%>"
                           style="width: 850px; height: 30px; border: 2px solid blue;">
                    <br> <br> <br> <br>
                    <div id="editor">
                        <textarea style="width: 1000px; height: 500px; border: 1px blue solid;"
                                  name="content"><%=a.getContent()%></textarea>
                    </div>
                    <br> <br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="hidden" name="id" value="<%=id%>"> <input
                        type="button" value="重置" onclick="location.reload()"
                        style="width: 100px; height: 30px; border: 2px solid blue;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="发布"
                           style="width: 100px; height: 30px; border: 2px solid blue;"/>
                </form>
            </center>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
