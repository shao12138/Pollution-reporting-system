<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <link href="css/zhuce.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/zhuce.js"></script>
</head>

<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <br/> <br/> <br/> <br/> <br/>
        <form action="zhuce" method="post" name="form1"
              id="fomr1">
            <fieldset style="width: 600px; margin: 0px auto; color: blue;">
                <legend>必填信息</legend>
                <table class="ss">
                    <tr>
                        <td>用户名:<br/> <br/></td>
                        <td><input type="text" name="name" placeholder="请输入用户名"
                                   autofocus="autofocus" required="required"/><br/> <br/></td>
                        <td><span>*支持中文用户名</span><br/> <br/></td>
                    </tr>
                    <tr>
                        <td>账号:<br/> <br/></td>
                        <td><input type="text" name="number" placeholder="请填写账号"
                                   required="required" onkeyup="value=value.replace(/\D/g,'')"
                                   onafterpaste="this.value=this.value.replace(/\D/g,'')"/><br/>
                            <br/></td>
                        <td><span>*只允许输入数字</span><br/> <br/></td>
                    </tr>

                    <tr>
                        <td>密码:<br/> <br/></td>
                        <td><input type="password" name="password"
                                   placeholder="请填写密码" required="required"
                                   onkeyup="value=value.replace(/\W/g,'')"
                                   onafterpaste="this.value=this.value.replace(/\W/g,'')"/><br/>
                            <br/></td>
                        <td><span>*只允许输入英文和数字</span><br/> <br/></td>
                    </tr>

                    <tr>
                        <td>重复密码:<br/> <br/></td>
                        <td><input type="password" name="password2"
                                   placeholder="请重复密码" required="required"
                                   onkeyup="value=value.replace(/\W/g,'')"
                                   onafterpaste="this.value=this.value.replace(/\W/g,'')"/><br/>
                            <br/></td>
                        <td><span>*只允许输入英文和数字</span><br/> <br/></td>
                    </tr>

                </table>
            </fieldset>
            <br/> <br/>
            <fieldset style="width: 600px; margin: 0px auto; color: blue;">
                <legend>身份验证</legend>
                <table class="ss">
                    <tr>
                        <td>身份证号:<br/> <br/></td>
                        <td><input type="text" name="personnumber"
                                   required="required" placeholder="请输入个人身份证号"
                                   onkeyup="value=value.replace(/\D/g,'')"><br/> <br/></td>
                        <td><span>*此项用于验证身份</span><br/> <br/></td>
                    </tr>
                    <tr>
                        <td>个人邮箱:<br/> <br/></td>
                        <td><input type="email" name="email" required="required"
                                   placeholder="请输入个人常用邮箱"><br/> <br/></td>
                        <td><span>*不要给我皮，别瞎输入</span><br/> <br/></td>
                    </tr>

                    <tr>
                        <td>个人电话:<br/> <br/></td>
                        <td><input type="text" name="tellnumber"
                                   onkeyup="value=value.replace(/\D/g,'')" placeholder="请输入手机号"
                                   onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                   required="required"><br/> <br/></td>
                        <td><span>*不要给我皮，别瞎输入</span><br/> <br/></td>
                    </tr>
                </table>
            </fieldset>
            <br/> <br/>
            <table style="margin: 0px auto;" class="ss">
                <tr>
                    <td><input type="reset" value="重置" id="ss"
                               style="color: blue;"/></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><input type="button" value="注册" id="ss"
                               style="color: blue;" onclick="check()"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>

</html>