<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest2</title>
</head>
<body>
<h1>jstlTest2.jsp</h1>
<form name="fm">
이름: <input type="text" name="name"><br>
<input type="submit" value="전달">
</form>
<hr>
<%-- if문 태그 --%>
<%-- empty 연산자: 검사할 객체가 비어있는지 판단 후 boolean값 리턴 --%>
<c:if test="${ empty param.name }">
	<h3 style="color: red;">이름 입력안함</h3>
</c:if>
<c:if test="${ param.name == '홍길동' }">
	<h3 style="color: blue;">홍길동님은 천재</h3>
</c:if>
<h3>넘어온 이름값: ${ param.name }</h3>
<hr>
<%-- if-else문 태그 --%>
<c:choose>
	<c:when test="${ param.name == 'killer' }">
		<h3 style="color: red;">killer는 입장불가</h3>
	</c:when>
	<c:when test="${ param.name == '둘리' }">
		<h3 style="color: red;">둘리 입장불가</h3>
	</c:when>
	<c:otherwise>
		<h3 style="color: blue;">입장 환영</h3>
	</c:otherwise>
</c:choose>
</body>
</html>