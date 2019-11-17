<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setAttribute("id", "hong");
request.setAttribute("addr", "서울");

//response.sendRedirect("paramTest3.jsp");	// redirect 방식으로 전달
%>
<jsp:forward page="paramTest3.jsp"/><!-- forward 방식 -->
</body>
</html>