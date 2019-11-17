<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function() {
	var fontNode = document.getElementById('fo');
	fontNode.setAttribute('color', 'blue');
	fontNode.setAttribute('color', 'red');
	//window.alert(fontNode.getAttribute('id'));
	fontNode.removeAttribute('color');
}
</script>
</head>
<body>
	<h1>ajaxTest10.jsp</h1>
	<font id="fo">element인터페이스 테스트</font>
</body>
</html>