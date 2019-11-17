<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function show() {
		sendRequest('getNotice.jsp', null, 'GET', showResult);
	}
	function showResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var divTag = document.all.newNotice;
				divTag.innerHTML = data;
			}
		}
	}
</script>
</head>
<body>
	<div id="newNotice"></div>
	<input type="button" value="공지사항 확인" onclick="show()">
</body>
</html>