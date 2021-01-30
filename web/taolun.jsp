<%@ page import="java.util.ArrayList" %>
<%@ page import="Test.Pojo.Message" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <script type="text/javascript" src="js/wangEditor.js"></script>
    <link href="css/taolun.css" type="text/css" rel="stylesheet"/>
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>

<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <div class="message" id="dd">
            <table>
                <%
                    ArrayList<Message> arrayList = (ArrayList) session.getAttribute("taolunDatas");
                    for (int i = 0; i < arrayList.size(); i++) {
                        Message a = arrayList.get(i);
                %>
                <tr>
                    <td><%=a.getName()%></td>
                    <td>&nbsp;：&nbsp;&nbsp;</td>
                    <td><%=a.getMessage()%></td>
                </tr>
                <%
                    }
                %>
            </table>

        </div>
        <div>
            <form action="InsertLiulian" method="post" class="sss" id="info"
                  style="margin: 0px auto;">
                <div id="editor" style="background-color: white;"></div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="重置" onclick="location.reload()"
                       style="width: 100px; height: 30px; border: 2px solid blue; color: blue;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="hidden" id="content" name="content"><input
                    type="button" id="publish" value="发送"
                    style="height: 30px; width: 110px; border: 2px solid blue; color: blue;">
            </form>
            <script type="text/javascript">
                var E = window.wangEditor
                var editor = new E('#editor')
                editor.create()
                document.getElementById('publish').addEventListener('click', function () {
                    var content = editor.txt.html();
                    document.getElementById("content").value = content;
                    document.getElementById("info").submit();
                }, false);
            </script>
        </div>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>
</html>