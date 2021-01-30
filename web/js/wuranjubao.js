function checkM(myform) {
	if (myform.file.value == "") {
		alert("请选择文件!");
		myform.file.focus();
		return false;
	}
}
function getFilePath(file) {
	var filePath;
	file.select();
	try {
		filePath = document.selection.createRange().text;// 获得文件的本地路径
	} finally {
		document.selection.empty();
	}
	return filePath;
}
function upload() {
	var file = document.getElementById("filePath");
	var str = getFilePath(file);
	document.getElementById("pathStr").value = encodeURI(str);
}