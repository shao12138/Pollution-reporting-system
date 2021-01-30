<%@page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Test.Pojo.Message" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>河流污染举报系统后台</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <script language="javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="ss.css"/>
    <link rel="stylesheet" type="text/css" href="css/shouye2.css"/>
</head>
<body>
<div id="mainDiv">
    <div id="topDiv">
        <div id="tmenu">
            <span style="font-size: 30px; color: yellow;">污染举报系统后台管理-言论管理</span>
        </div>
    </div>
    <div id="centerDiv">
        <jsp:include page="part/back_navigation.jsp"/>
        <div id="right">
            <table class="table3_11">
                <tr>
                    <td>编号</td>
                    <td>昵称</td>
                    <td>信息</td>
                    <td>删除</td>
                </tr>
                <%
                    ArrayList arrayList = (ArrayList) session.getAttribute("taolunDatas");
                    for (int i=0;i<arrayList.size();i++){
                        Message message = (Message) arrayList.get(i);
                %>
                <tr>
                    <td><%=i+1%></td>
                    <td><%=message.getName()%></td>
                    <td><%=message.getMessage()%></td>
                    <form action="DeleteMessage" method="post">
                        <td><input type="hidden" value="<%=message.getId()%>" name="id"/> <input
                                type="submit" value="移除"/></td>
                    </form>
                </tr>
                <%
                    }
                %>
            </table>

        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
