<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest3</title>
</head>
<body>
<h1>jstlTest3.jsp</h1>
<%
String[] str = { "사과", "배", "포도", "딸기" }; 
%>
<%-- 확장형(향상된) for문 태그 --%>
<c:set var="fruit" value="<%= str %>"/>
<ul>
<c:forEach var="temp" items="${ fruit }">
	<li>${ temp }</li>
</c:forEach>
</ul>
<%-- 일반 for문 태그: 음수/감소 불가, break/continue 불가 --%>
<c:forEach var="i" begin="1" end="10" step="1">
	${ i }&nbsp;&nbsp;
</c:forEach>
<hr>
<c:forEach var="j" begin="2" end="9" step="1">
	<c:forEach var="k" begin="1" end="9" step="1">
		${ j } * ${ k } = ${ j * k }&nbsp;&nbsp;
	</c:forEach>
	<br>
</c:forEach>
<hr>
<%-- Tokenizer 태그 --%>
<c:forTokens var="temp" items="사과, 배, 포도, 딸기" delims=", ">
	${ temp }&nbsp;&nbsp;
</c:forTokens>
</body>
</html>