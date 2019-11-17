<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.emp.*"%><!-- DTO DAO 클래스 사용위한 임포트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모오든 사원 내역 (Beans)</title>
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
<h2>모오든 사원 내역 (Beans)</h2>
<table summary="모든 사원 내역">
<thead>
<tr>
	<th>사원번호</th>
	<th>사원이름</th>
	<th>E-mail</th>
	<th>부서명</th>
</tr>
</thead>
<tbody>
<!-- DAO bean을 이용한 기능사용 -->
<jsp:useBean id="edao" class="listo.emp.EmpDAO"/>
<%
	EmpDTO[] dtos = edao.empList();	// empList() 메서드가 반환한 배열 저장
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
