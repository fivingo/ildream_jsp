<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeeUpdate</title>
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
<%
	// getParameter(name)을 이용해 값 가져옴
	String eidx_s = request.getParameter("eidx");
	// 유효성 검사
	if (eidx_s == null || eidx_s.equals("")) {
		eidx_s = "0";
	}
	int eidx = Integer.parseInt(eidx_s);
	
	// DB 연동
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "ildream";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(url, user, pwd);
	
	// 쿼리 설정 - 조건에 따른 데이터 조회
	String sql = "SELECT * FROM employee WHERE eidx = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, eidx);
	// 조회된 데이터 저장 객체
	ResultSet rs = ps.executeQuery();
%>
<form name="empUpdate" action="empUpdate_ok.jsp">
<table>
<tr><th colspan="2"><%= eidx %>번 사원정보</th></tr>
<%	
	// 반복문을 이용해 저장된 데이터 출력
	while (rs.next()) {
%>
		<tr>
		<td>사원 번호:</td><td><%= rs.getInt("eidx") %>
		<!--
		hidden: getPamameter() 메서드는 한페이지만 값을 전달할수있기에
		받은 값은 갖고있지만 화면에 출력은 되지않는 hidden타입을 이용하여 넘어온 값을 보유하고 다음 페이지에 전달한다.
		-->
		<input type="hidden" name="eidx" value="<%= rs.getString("eidx") %>"><br></td>
		</tr>
		<tr>
		<td>이름:</td>
		<td><input type="text" name="ename" value="<%= rs.getString("ename") %>"><br></td>
		</tr>
		<tr>
		<td>E-mail:</td>
		<td><input type="text" name="eemail" value="<%= rs.getString("eemail") %>"><br></td>
		</tr>
		<tr>
		<td>부서:</td>
		<td><input type="text" name="edept" value="<%= rs.getString("edept") %>"><br></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
		<!-- onclick 내부에선 JavaScript 코드 사용 가능 -->
		<!-- location.href='url': 접속중인 페이지의 정보를 담고있는 프로퍼티, 값 변경시 페이지 이동 -->
		<input type="button" value="취소" onclick="location.href='emp.jsp'"></td>
		</tr>
<% 
	}

	// 연동된 DB 닫기
	rs.close();
	ps.close();
	conn.close();
%>
</table>
</form>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
