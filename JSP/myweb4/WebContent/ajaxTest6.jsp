<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show() {
		var divTag = document.all.distest;
		divTag.style.display = '';
	}
</script>
</head>
<body>
	<input type="button" value="test" onclick="show()">
	<div id="distest" style="border: 1px solid gray; width: 100px; height: 100px; display: none;"></div>
</body>
</html>