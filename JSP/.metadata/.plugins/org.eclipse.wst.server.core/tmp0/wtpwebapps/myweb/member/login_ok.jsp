<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.member.*" %>
<jsp:useBean id="ldao" class="listo.member.MemberDAO" scope="session"/>
<%
// 로그인 - 세션 생성
String userId = request.getParameter("mid");
String userPwd = request.getParameter("mpwd");

int checkResult = ldao.loginCheck(userId, userPwd);	// 로그인 id, pw 확인
String userName = ldao.getUserInfo(userId);			// 확인 후 이름 받아오기

switch(checkResult) {	// 로그인 확인시 3가지 경우
	case 1:
%>
		<script>
		window.alert('가입된 아이디가 없습니다');
		location.href='login.jsp';
		</script>
<%
	break;
	case 2:
%>
		<script>
		window.alert('비밀번호가 틀립니다');
		location.href='login.jsp';
		</script>
<%
	break;
	case 3:
%>
		<script>
		window.alert('로그인 완료! <%= userId %>님 환영환영');
		window.self.close();
		opener.location.reload();
		</script>
<%
		session.setAttribute("login_id", userId);
		session.setAttribute("login_name", userName);
}
%>

<%
// ID기억 쿠키 생성
String idMemory = request.getParameter("idMemory");

if (idMemory != null){	// checkBox 체크 확인
	Cookie idMemory_cookie = new Cookie("idMemory", userId);
	idMemory_cookie.setMaxAge(60 * 60 * 24 * 7);	// 일주일
	response.addCookie(idMemory_cookie);
}
%>