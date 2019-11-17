<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeeList</title>
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
<h2>모든 사원 내역</h2>
<!-- summary: 테이블에대한 요약 -->
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
<%
	// DB 연동
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "ildream";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(url, user, pwd);
	
	// 쿼리 설정 - 테이블의 모든 데이터 조회 후 내림차순 정렬
	String sql = "SELECT * FROM employee ORDER BY eidx DESC";
	PreparedStatement ps = conn.prepareStatement(sql);
	// 조회된 데이터 저장 객체
	ResultSet rs = ps.executeQuery();
	
	// 조건문과 반복문을 이용해 저장된 데이터 출력
	if (rs.next()) {
		do {
%>
			<tr>
			<td><%= rs.getInt("eidx") %></td>
			<td><%= rs.getString("ename") %></td>
			<td><%= rs.getString("eemail") %></td>
			<td><%= rs.getString("edept") %></td>
			</tr>
<% 
		} while (rs.next());
	} else {
%>
		<tr>
		<td colspan="4" align="center">
		등록된 사람이 없습니다
		</tr>
<% 
	}
	
	// 연동된 DB 닫기
	rs.close();
	ps.close();
	conn.close();
%>
</tbody>
</table>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
