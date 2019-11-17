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
<h1>모든 사원 내역</h1>
<table border="1" width="550" cellspacing="0">
<thead>
<tr>
<th>사원번호</th>
<th>사원이름</th>
<th>E-mail</th>
<th>부서명</th>
</tr>
</thead>
<tbody>
<c:set var="arr" value="${ requestScope.edtos }"/>
<c:if test="${ empty arr }">
	<tr>
	<td colspan="4" align="center">
	등록된 사원이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="dto" items="${ arr }">
	<tr>
	<td>${ dto.eidx }</td>
	<td>${ dto.ename }</td>
	<td>${ dto.eemail }</td>
	<td>${ dto.edept }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>