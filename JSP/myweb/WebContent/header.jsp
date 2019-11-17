<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function openLogin() {	// 로그인 팝업창
	window.open('/myweb/member/login.jsp', 'login', 'width=400, height=200, top=200, left=700');
}
</script>
<header>
<div>
<%
// 로그인시 세션생성과 함께 저장된 이름 받아오기
String userName = (String) session.getAttribute("login_name");
// 로그인 session 확인
if (userName == null) {	// session x
%>
	<!-- a태그에 js함수 사용 가능 -->
	<a href="javascript:openLogin()">로그인</a>|
	<a href="/myweb/member/memberJoin.jsp">회원가입</a>
<%
} else {	// session o
%>
	<%= userName %>님 로그인 중|
	<a href="/myweb/member/logout_ok.jsp">로그아웃</a>
<%
}
%>
</div>
<h1>JSP Study Site</h1>
<nav>
	<ul>
		<!-- 절대경로: /프로젝트명(최상위경로)/index.jsp -->
		<li><a href="/myweb/index.jsp">Home</a></li>
		<li><a href="#">Profile</a></li>
		<li><a href="/myweb/wf/webFolder.jsp">WebFolder</a></li>
		<li><a href="/myweb/bbs/bbsList.jsp">BBS</a></li>
		<li><a href="/myweb/guestbook/guestBook.jsp">GuestBook</a></li>
	</ul>
</nav>
<hr>
</header>