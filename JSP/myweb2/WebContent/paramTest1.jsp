<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>paramTest1.jsp</h1>
<form name="f1" action="paramTest2.jsp">
<ul>
<li>이름: <input type="text" name="name"></li>
<li>나이: <input type="text" name="age"></li>
</ul>
<input type="submit" value="전달">
</form>
</body>
</html>