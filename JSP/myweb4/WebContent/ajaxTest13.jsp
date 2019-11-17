<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script>
	function show() {
		sendRequest('getStudents.jsp', null, 'GET', showResult);
	}
	function showResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var xmlDoc = XHR.responseXML;
				var studentList = xmlDoc.getElementsByTagName('student');
				var msg = '총 학생 수 : ' + studentList.length + '명\n';

				for (var i = 0; i < studentList.length; i++) {
					var student = studentList.item(i);

					var name = student.getElementsByTagName('name').item(0).firstChild.nodeValue;
					var age = student.getElementsByTagName('age').item(0).firstChild.nodeValue;
					var addr = student.getElementsByTagName('addr').item(0).lastChild.nodeValue;

					msg += '이름: ' + name + ' 나이: ' + age + ' 주소: ' + addr + '\n';
				}
				window.alert(msg);
			}
		}
	}
</script>
</head>
<body>
	<input type="button" value="학생정보확인" onclick="show()">
</body>
</html>