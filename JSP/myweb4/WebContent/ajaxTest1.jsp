<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var XHR = null;

	function getXHR() {
		if (window.ActiveXObject) {
			return new ActiveXObject('Msxml2.XMLHTTP');
		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}
	}
	function show() {
		//요청을 전담
		var name = document.fm.name.value;
		var param = 'name=' + name;

		XHR = getXHR();
		XHR.onreadystatechange = showResult;
		XHR.open('GET', 'testResult.jsp?' + param, true);
		XHR.send(null);
	}
	function showResult() {
		//응답을 전담
		//window.alert('test');
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				window.alert(data);
			}
		}
	}
</script>
</head>
<body>
	<h1>ajaxTest1.jsp</h1>
	<form name="fm" enctype="application/x-www-form-urlencoded">
		이름:<input type="text" name="name"><br>
		<input type="button" value="ajaxTest" onclick="show()">
	</form>
</body>
</html>