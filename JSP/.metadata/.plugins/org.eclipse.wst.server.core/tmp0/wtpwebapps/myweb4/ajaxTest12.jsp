<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var number = 1;

	function kiki() {
		var newItemNode = document.createElement('div');
		newItemNode.setAttribute('id', 'node' + number)
		var testNode = document.createTextNode(number + '번 item');
		var delNode = document.createElement('input');
		delNode.setAttribute('type', 'button');
		delNode.setAttribute('value', '삭제');
		delNode.setAttribute('onclick', 'keke(\'' + number + '\')');

		newItemNode.appendChild(testNode);
		newItemNode.appendChild(delNode);

		var buttonNode = document.getElementById('a');
		var bodyNode = buttonNode.parentNode;
		bodyNode.appendChild(newItemNode);

		number++;
	}
	function keke(i) {
		var itemNode = document.getElementById('node' + i);
		var bodyNode = itemNode.parentNode;
		bodyNode.removeChild(itemNode);
	}
</script>
</head>
<body>
	<input id="a" type="button" value="추가" onclick="kiki()">
</body>
</html>