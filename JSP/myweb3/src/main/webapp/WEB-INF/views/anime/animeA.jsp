<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>인기 애니메이션 검색어: 
<c:forEach var="key" items="${ keywords }">
	${ key }&nbsp;&nbsp;
</c:forEach>
</h3>
<form name="animeFind" action="animeFindB.do">
<select name="category">
<c:forEach var="option" items="${ category }">
	<option value="${ option }">${ option }</option>
</c:forEach>
</select>
<input type="text" name="findValue">
<input type="submit" value="검색">
</form>
<hr>
<h1>현재 페이지는 animeA.jsp</h1>
</body>
</html>