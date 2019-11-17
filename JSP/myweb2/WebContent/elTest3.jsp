<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest3</title>
</head>
<body>
<h1>elTest3.jsp</h1>
<h3>이름: <%= request.getParameter("name") %></h3>
<h3>id: <%= request.getAttribute("id") %></h3>
<hr>
<%-- 요청 파라미터의 매핑을 저장한 Map 객체 --%>
<h3>나이: ${ param.age }</h3>
<%-- request 기본 객체에 저장된 속성의 매핑을 저장한 Map 객체 --%>
<h3>주소: ${ requestScope.addr }</h3>
</body>
</html>