<%@ page import="java.util.ArrayList" %>
<%@ page import="Test.Pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>河流污染举报系统后台</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="ss.css"/>
    <link rel="stylesheet" type="text/css" href="css/shouye2.css"/>
</head>
<body>
<div id="mainDiv">
    <div id="topDiv">
        <div id="tmenu">
            <span style="font-size: 30px; color: yellow;">污染举报系统后台管理-用户信息</span>
        </div>
    </div>
    <div id="centerDiv">
        <jsp:include page="part/back_navigation.jsp"/>
        <div id="right">
            <table class="table3_11">
                <tr>
                    <td>序号</td>
                    <td>账号</td>
                    <td>用户名</td>
                    <td>密码</td>
                    <td>身份证号码</td>
                    <td>email</td>
                    <td>电话号码</td>
                    <td>删除/增加</td>
                </tr>
                <%
                    ArrayList<User> arrayList = (ArrayList<User>) session.getAttribute("userData");
                    if (arrayList== null) {
                %>
                <tr align="center" valign="middle">
                    <td colspan="4">没有记录显示！</td>
                </tr>
                <%
                } else {
                    for (int i = 0; i < arrayList.size(); i++) {
                        User a = arrayList.get(i);
                %>
                <tr align="center" valign="middle" height="22">
                    <td><%=i + 1%>
                    </td>
                    <td><%=a.getName()%>
                    </td>
                    <td><%=a.getNumber()%>
                    </td>
                    <td><%=a.getPassword()%>
                    </td>
                    <td><%=a.getPersonnumber()%>
                    </td>
                    <td><%=a.getEmail()%>
                    </td>
                    <td><%=a.getTellnumber()%>
                    </td>
                    <td>
                        <form action="DeleteUser" method="post">
                            <input type="hidden" value="<%=a.getNumber()%>" name="number"/>
                            <input type="submit" value="删除"/>
                        </form>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                %>
                <tr>
                    <%--和注册公用一个--%>
                    <form action="back_zhuce" method="post">
                        <td>自动生成</td>
                        <td><input type="text" name="name" required="required"/></td>
                        <td><input type="text" name="number" required="required"/></td>
                        <td><input type="text" name="password" required="required"/></td>
                        <td><input type="text" name="personnumber" required="required"/></td>
                        <td><input type="text" name="email" required="required"/></td>
                        <td><input type="text" name="tellnumber" required="required"/></td>
                        <td><input type="submit" value="增加"/></td>
                    </form>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
