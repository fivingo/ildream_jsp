<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- 기능만 있는 페이지라 HTML 태그 삭제 -->
<%
	// getParameter(name)을 이용해 값 가져옴
	String ename = request.getParameter("ename");
	
	// DB 연동
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "ILDREAM";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(url, user, pwd);
	
	// 쿼리 설정 - 데이터 삭제
	String sql = "DELETE FROM employee WHERE ename=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, ename);
	
	// 실행 횟수
	int count = ps.executeUpdate();
	
	// 연동된 DB 닫기
	ps.close();
	conn.close();
	
	// 결과 경고창으로 출력
	if (count > 0) {
%>
	<script>
	window.alert("사원 삭제 성공");
	location.href='emp.jsp';	// 지정페이지로 이동
	</script>
<%	
	} else {
%>
	<script>
	window.alert("사원 삭제 실패");
	location.href='emp.jsp';	// 지정페이지로 이동
	</script>
<%
	}
%>