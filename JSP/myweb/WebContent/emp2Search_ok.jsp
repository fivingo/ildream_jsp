<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.emp.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 검색</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
<style>
h2 {
	text-align: center;
}
table {
	width: 450px;
	margin: 0px auto;
	border-spacing: 0px;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}
table th {
	background-color: skyblue;
}
table tr td {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<article>
<h2>사원 검색</h2>
<table>
<thead>
	<tr>
		<th>사원번호</th>
		<th>사원이름</th>
		<th>E-mail</th>
		<th>부서명</th>
	</tr>
</thead>
<tbody>
<jsp:useBean id="edto" class="listo.emp.EmpDTO"/>
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="listo.emp.EmpDAO"/>
<%	// 입력한 이름으로 검색 후 결과 배열로 반환 (이름 중복 가능성)
	EmpDTO[] dtos = edao.empSearch(edto);	
	if (dtos == null || dtos.length == 0) {
%>
		<tr>
			<td colspan="4" align="center">
			등록된 사람이 없습니다
		</tr>
<%
	} else {
		for (int i = 0; i < dtos.length; i++) {
			EmpDTO dto = dtos[i];
%>
			<tr>
				<td><%= dto.getEidx() %></td>
				<td><%= dto.getEname() %></td>
				<td><%= dto.getEemail() %></td>
				<td><%= dto.getEdept() %></td>
			</tr>
<%
		}
	}
%>
</tbody>
</table>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>