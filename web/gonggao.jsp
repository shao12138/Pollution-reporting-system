<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Test.Pojo.Notice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>河流污染查看系统</title>
    <link rel="shortcut icon" href="img/title.ico" />
    <link href="css/gonggao.css" type="text/css" rel="stylesheet" />
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <table>
            <%
                ArrayList<Notice> arrayList = (ArrayList<Notice>) session.getAttribute("noticeDate");
                Notice a;
                for (int i=0;i<arrayList.size();i++){
                    a = arrayList.get(i);
            %>
            <tr>
                <td><a href="gonggao-detail.jsp?id=<%=i%>"> <%=i+1%>，<%=a.getTitle()%>------<%=a.getDate()%></a></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>

</html>