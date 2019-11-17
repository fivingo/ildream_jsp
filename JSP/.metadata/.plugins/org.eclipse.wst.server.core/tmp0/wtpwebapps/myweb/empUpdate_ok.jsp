<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- 기능만 있는 페이지라 HTML 태그 삭제 -->
<%
	// getParameter(name)을 이용해 값 가져옴
	//request.setCharacterEncoding("utf-8");	// post방식으로 전송시 글자깨짐 방지
	String eidx = request.getParameter("eidx");
	String ename = request.getParameter("ename");
	String eemail = request.getParameter("eemail");
	String edept = request.getParameter("edept");
	
	// DB 연동
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "ildream";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(url, user, pwd);
	
	// 쿼리 설정 - 데이터 수정
	String sql = "UPDATE employee SET ename = ?, eemail = ?, edept = ? WHERE eidx = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(4, eidx);
	ps.setString(1, ename);
	ps.setString(2, eemail);
	ps.setString(3, edept);

	// 실행 횟수
	int count = ps.executeUpdate();
	
	// 연동된 DB 닫기
	ps.close();
	conn.close();
	
	// 실행 결과 경고창으로 출력
	String msg = count > 0 ? "사원 정보 수정 완료" : "사원 정보 수정 실패실패실패";
%>
<script>
window.alert("<%= msg %>");
location.href = "emp.jsp";	// 지정 페이지로 이동
</script>	
