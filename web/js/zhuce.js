function check() {
	var p1 = document.form1.password.value; // 获取密码框的值
	var p2 = document.form1.password2.value; // 获取重新输入的密码值
	var name = document.form1.name.value;
	var number = document.form1.number.value;
	var email = document.form1.email.value;
	var personnumber = document.form1.personnumber.value;
	var tellnumber = document.form1.tellnumber.value;
	var re = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
	var pm = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	var tm = /^1[34578]\d{9}$/;
	if (name == null || name == "") {
		alert("请输入用户名");
	} else if (number == null || number == "") {
		alert("请输入账号");
	} else if (p2 == null || p2 == "") {
		alert("请再次输入密码");
	} else if (p1 == null || p1 == "") {
		alert("请输入密码");
	} else if (p1 != p2) {
		alert("输入密码与确认密码不一样");
	} else if (personnumber == null || personnumber == "") {
		alert("请输入个人身份证号码");
	} else if (email == null || email == "") {
		alert("请输入个人邮箱");
	} else if (tellnumber == null || tellnumber == "") {
		alert("请输入个人电话");
	} else if (!pm.test(personnumber)) {
		alert("你输入的身份证号码不合法");
	} else if (!re.test(email)) {
		alert("你输入的邮箱不合法");
	} else if (!tm.test(tellnumber)) {
		alert("皮？你他妈电话" + tellnumber.length + "位啊！");
	} else {
		document.form1.submit();
	}
}