<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Test.Pojo.Pic" %>
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
            <span style="font-size: 30px; color: yellow;">污染举报系统后台管理-污染分布</span>
        </div>
    </div>
    <div id="centerDiv">
        <jsp:include page="part/back_navigation.jsp"/>
        <div id="right">
            <table class="table3_11">
                <tr>
                    <td>编号</td>
                    <td>图片</td>
                    <td>经度</td>
                    <td>纬度</td>
                    <td>是否解决</td>
                </tr>
                <%
                    ArrayList<Pic> arrayList = (ArrayList<Pic>) session.getAttribute("picDate");
                    for (int i = 0; i < arrayList.size(); i++) {
                        Pic pic = arrayList.get(i);
                %>
                <tr>
                    <td><%=i+1%></td>
                    <td><img src=<%=pic.getUrl()%> style="width:200px;height:150px;"/></td>
                    <td><%=pic.getLog()%></td>
                    <td><%=pic.getLat()%></td>
                    <form action="DeletePic" method="post">
                        <td><input type="hidden" value="<%=pic.getId()%>" name="id"/>
                            <input type="submit" value="解决"/>
                        </td>
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
