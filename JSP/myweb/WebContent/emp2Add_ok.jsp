<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="edto" class="listo.emp.EmpDTO"/><!-- DTO 호출 -->
<jsp:setProperty property="*" name="edto"/>		<!-- DTO에 정보 입력 -->
<jsp:useBean id="edao" class="listo.emp.EmpDAO"/><!-- DAO 호출 -->
<%
	int result = edao.empAdd(edto);
	String msg = result > 0 ? "사원 등록 성공 (Beans)" : "사원 등록 실패실패실패 (Beans)";
%>
<script>
	window.alert('<%= msg %>');
	location.href='emp2.jsp';
</script>