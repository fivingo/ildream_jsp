<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메모작성하기</h1>
<form name="memoWrite" action="memoWrite.do" method="POST">
<ul>
	<li>번호: <input type="text" name="idx"></li>
	<li>작성자: <input type="text" name="writer"></li>
	<li>내용: <br><textarea rows="10" cols="35" name="content"></textarea></li>
</ul>
<p>
<input type="submit" value="메모작성">
</p>
</form>
</body>
</html>