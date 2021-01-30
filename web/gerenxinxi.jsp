<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>河流污染查看系统</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <link href="css/gerenxinxi.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/gerenxinxi.js"></script>
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
        <form name="form2" action="" method="post">
            <table class="table3">
                <tr>
                    <td colspan="3">输入密保即可获得修改权限(个人邮箱或者个人电话)</td>
                </tr>
                <tr>
                    <td style="text-align: center;">个人邮箱</td>
                    <td style="text-align: center;"><input type="email"
                                                           required="required" name="email"></td>
                    <td style="text-align: center;"><input type="hidden"
                                                           name="emailtext" value="${sessionScope.user.email}"></td>
                </tr>
                <tr>
                    <td style="text-align: center;">个人电话</td>
                    <td style="text-align: center;"><input type="text"
                                                           required="required" name="tellnumber"></td>
                    <td style="text-align: center;"><input type="hidden"
                                                           name="tellnumbertext"
                                                           value="${sessionScope.user.tellnumber}"></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="3"><input
                            type="button" value="验证" onclick="maxcheck()"></td>
                </tr>
            </table>
        </form>
        <br/>
        <table class="table3">
            <tr>
                <td>基本信息</td>
                <td>内容</td>
                <td></td>
                <td>修改值</td>
                <td>是否修改</td>
            </tr>
            <tr>
                <form action="UpdateName" method="post" name="formmax2">
                    <td>用户名</td>
                    <td>${sessionScope.user.name}</td>
                    <td><input type="hidden" name="number" value="${sessionScope.user.number}"></td>
                    <td><input type="text" name="name" required="required"></td>
                    <td style="text-align: center;"><input type="submit" value="修改" id="buttonname" name="buttonname"
                                                           disabled="disabled"></td>
                </form>
            </tr>
            <tr>
                <td>账号</td>
                <td>${sessionScope.user.number}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <form action="UpdatePassword" method="post" name="formmax1">
                    <td>密码</td>
                    <td>${sessionScope.user.password}</td>
                    <td><input type="hidden" name="number" value="${sessionScope.user.number}"></td>
                    <td><input type="text" name="password" required="required"></td>
                    <td style="text-align: center;"><input type="submit"
                                                           value="修改" id="buttonname" name="buttonname"
                                                           disabled="disabled"></td>
                </form>
            </tr>
        </table>

    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>

</html>