<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 이렇게하면 servlet과 다를바없음
	out.println("<table border='1'>");
	for (int i = 2; i <= 9; i++) {
		out.println("<tr>");
		for (int j = 1; j <= 9; j++){
			out.println("<td>" + i + " * " + j + " = " + (i * j) + "</td>");
		}
		out.println("</tr>");
	}
	out.println("</table>");
%>
<hr>
<table border="1">
<!--
표현식 (expression): 세미콜론(;) 사용x
-> servlet으로 변환시 out.print()를 사용하며 자동으로 사용됨 
-->
<% for (int i = 2; i <= 9; i++) { %>
	<tr>
	<% for (int j = 1; j <= 9; j++) { %>
		<td><%= i %> * <%= j %> = <%= i * j %></td>
	<% } %>
	</tr>
<% } %>
</table>
</body>
</html>
