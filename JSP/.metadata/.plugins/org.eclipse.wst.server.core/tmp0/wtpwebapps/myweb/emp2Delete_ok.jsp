<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="edto" class="listo.emp.EmpDTO"/>
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="listo.emp.EmpDAO"/>
<%
	int result = edao.empDelete(edto);
	String msg = result > 0 ? "사원 정보 삭제 성공 (Beans)" : "사원 정보 삭제 실패실패실패 (Beans)";
%>
<script>
	window.alert('<%= msg %>');
	location.href='emp2.jsp';
</script>