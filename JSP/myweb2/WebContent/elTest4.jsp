<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest4</title>
</head>
<body>
<h1>elTest4.jsp</h1>
<h3>boolean 자료형: ${ true }</h3>
<h3>정수 자료형: ${ 10 }</h3>
<h3>실수 자료형: ${ 3.14 }</h3>
<h3>문자열 자료형: ${ '홍길동' }</h3>
<h3>null 데이터: ${ null }</h3>
<h3>3 + 5 = ${ 3 + 5 }</h3>
<h3>"3" + 5 = ${ "3" + 5 }</h3>
<h3>"삼" + 5 = <%-- ${ "삼" + 5 } --%></h3>
<h3>null + 5 = ${ null + 5 }</h3>
<h3>3 / 2 = ${ 3 div 2 }</h3>
<h3>3 % 2 = ${ 3 mod 2 }</h3>
<h3>3 == 2 = ${ 3 eq 2 }</h3>
<h3>3 != 2 = ${ 3 ne 2 }</h3>
</body>
</html>