<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="listo.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="listo.member.MemberDAO"/>
<%
	int result = mdao.memberJoin(mdto);
	String msg = result > 0 ? "회원 가입 성공!!" : "회원 가입 실패실패실패패";
%>
<script>
	window.alert('<%= msg %>');
	location.href='../index.jsp';
</script>