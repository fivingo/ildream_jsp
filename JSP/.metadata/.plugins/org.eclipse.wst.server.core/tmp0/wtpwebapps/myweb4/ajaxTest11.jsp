<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		var newSpanNode = document.createElement('span');
		var newSpanTextNode = document.createTextNode('이것은 새로운 span태그입니다.');

		newSpanNode.appendChild(newSpanTextNode);

		var h1Node = document.getElementById('a');
		var bodyNode = h1Node.parentNode;
		bodyNode.insertBefore(newSpanNode, h1Node);

		bodyNode.removeChild(h1Node);
	}
</script>
</head>
<body>
	<h1 id="a">이것은 제목입니다.</h1>
	<form>이것은 form태그입니다.</form>
</body>
</html>