<%@ page import="java.util.ArrayList" %>
<%@ page import="Test.Pojo.Notice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>河流污染举报系统后台</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <script type="text/javascript" src="js/wangEditor.js"></script>
    <link rel="stylesheet" type="text/css" href="ss.css"/>
    <link rel="stylesheet" type="text/css" href="css/shouye3.css"/>
</head>
<body>
<div id="mainDiv">
    <div id="topDiv">
        <div id="tmenu">
            <span style="font-size: 30px; color: yellow;">污染举报系统后台管理-公告发布</span>
        </div>
    </div>
    <div id="centerDiv">
        <jsp:include page="part/back_navigation.jsp"/>
        <div id="right">
            <table class="table3_11">
                <%
                    ArrayList<Notice> arrayList = (ArrayList<Notice>) session.getAttribute("noticeDate");
                    Notice a;
                    for (int i = 0; i < arrayList.size(); i++) {
                        a = arrayList.get(i);
                %>
                <tr>
                    <td><a href="gonggao-detail.jsp?id=<%=i%>"><%=a.getTitle()%>------<%=a.getDate()%>
                    </a></td>
                    <td style="width: 80px;text-align: center;">
                        <form action="DeleteNotice" method="post">
                            <input type="hidden" value="<%=a.getId()%>" name="id"/>
                            <input type="submit" value="删除"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td style="width: 1150px;"><%=a.getContent()%>
                    </td>
                    <td style="width: 80px;text-align: center;">
                        <form action="back-gonggao-edit.jsp" method="post">
                            <input type="hidden" value="<%=a.getId()%>" name="id"/>
                            <input type="submit" value="编辑"/>
                        </form>
                    </td>
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
