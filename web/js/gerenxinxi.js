function maxcheck() {
	var email = document.form2.email.value;
	var tellnumber = document.form2.tellnumber.value;
	var emailtext = document.form2.emailtext.value;
	var tellnumbertext = document.form2.tellnumbertext.value;
	if (email == emailtext || tellnumber == tellnumbertext) {
		alert("验证成功，您可以修改信息了");
		document.formmax1.buttonname.disabled = false;
		document.formmax2.buttonname.disabled = false;
	}else{
		alert("您的密保错了。如需找回密码，请联系qq1966799809");
	}
}