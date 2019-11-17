<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.emp.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 수정</title>
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
<h2>사원 수정</h2>
<jsp:useBean id="edto" class="listo.emp.EmpDTO"/>
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="listo.emp.EmpDAO"/>
<form name="empUpdate" action="emp2Update_ok.jsp">
<table>
<tr><th colspan="2"><%= edto.getEidx() %>번 사원정보</th></tr>
<%
	EmpDTO dto = edao.empUpdate(edto);
	if (dto == null) {
%>
		<tr>
			<td colspan="4" align="center">
			등록된 사람이 없습니다
		</tr>
<%
	} else {
%>
			<tr>
			<td>사원 번호:</td><td><%= dto.getEidx() %>
			<input type="hidden" name="eidx" value="<%= dto.getEidx() %>"><br></td>
			</tr>
			<tr>
			<td>이름:</td><td>
			<input type="text" name="ename" value="<%= dto.getEname() %>"><br></td>
			</tr>
			<tr>
			<td>E-mail:</td><td>
			<input type="text" name="eemail" value="<%= dto.getEemail() %>"><br></td>
			</tr>
			<tr>
			<td>부서:</td><td>
			<input type="text" name="edept" value="<%= dto.getEdept() %>"><br></td>
			</tr>
			<tr>
			<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='emp2.jsp'"></td>
			</tr>
<%
	}
%>
</table>
</form>
</article>
</section>
</body>
</html>