<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>

<head>
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <link href="css/quxinxi.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/wuranjubao.js"></script>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
        <br/> <br/> <br/> <br/> <br/>
        <form action="InsertJubao" name="form1" id="form1" method="post" enctype="multipart/form-data">
            <fieldset style="width: 400px; margin: 0px auto; color: red;">
                <table class="table3">
                    <tr>
                        <td style="font-size: 25px; color: green;">照片：</td>
                        <td>&nbsp;&nbsp;</td>
                        <td><input type="file" id="filePath" name="image" required="required"
                                   style="font-size: 20px;color:blue;" value="选择"/></td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="重置"
                                   style="width: 80px; height: 30px; color: blue; font-weight: bold; font-size: 20px; opacity: 0.7;">
                        </td>
                        <td>&nbsp;&nbsp;</td>
                        <td><input type="submit" name="Submit" value="上 传"
                                   style="width: 80px; height: 30px; color: blue; font-weight: bold; font-size: 20px; opacity: 0.7;">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>
</html>