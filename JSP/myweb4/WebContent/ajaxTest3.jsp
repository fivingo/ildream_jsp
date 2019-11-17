<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show() {
		var ptag = document.all.p;
		//window.alert(ptag.innerHTML);
		ptag.innerHTML = '<i style="color:red;">아! 바꼈음!</i>';
	}
</script>
</head>
<body>
	<p id="p"><b>ajaxTest3.jsp</b><br><i>test</i></p>
	<input type="button" value="바껴!" onclick="show()">
</body>
</html>