<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 - 세션 삭제
//session.removeAttribute("login_id");
//session.removeAttribute("login_name");
session.invalidate();	// 로그아웃시 웬만하면 사용
%>
<script>// 세션 삭제 후 기본화면으로 이동
location.href='/myweb/index.jsp';
</script>