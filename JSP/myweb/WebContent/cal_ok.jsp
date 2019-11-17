<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calculator_ok</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<h3>계산결과</h3>
<%
	// 값 가져오기
	int num1 = Integer.parseInt(request.getParameter("num1"));
	String operator = request.getParameter("operator");	
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int result = 0;
	
	if (num2 == 0 && operator.equals("/")) {	// 유효성 검사
		out.println("<h1>0으로 못나눔</h1>");
	} else {
		switch (operator.charAt(0)) {	// 문자열의 첫번째'문자' (스위치 문자열x)
			case '+':
				result = num1 + num2;
				break;
			case '-':
				result = num1 - num2;
				break;
			case '*':
				result = num1 * num2;
				break;
			case '/':
				result = num1 / num2;
		}
	}
%>
<article>
<h3><%= num1 %> <%= operator %> <%= num2 %> = <%= result %></h3> 
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>