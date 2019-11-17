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
<section>
<article>
<h2>게스트북</h2>
<form name="write" action="guestWrite.listo">
<div>
이름: <input type="text" name="gwriter"><br>
<textarea name="gcontent" rows="5" cols="80"></textarea><br>
<input type="submit" value="확인">
</div>
<hr>
</form>
<c:set var="lists" value="${ requestScope.lists }"/>
<c:forEach var="temp" items="${ lists }">
<br><div>${ temp.gid }<br>
<textarea rows="5" cols="80" readonly="readonly">${ temp.gcontent }</textarea>
</div>
</c:forEach>
</article>
</section>
</body>
</html>