<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 쿠키 저장하기 - 공지팝업창
Cookie notice = new Cookie("notice", "noPopup");// 1. 쿠키 객체 생성
notice.setMaxAge(60 * 60 * 24);					// 2. 쿠키 나이 지정 (초)
response.addCookie(notice);						// 3. 브라우저(클라이언트)에 추가
%>
<script>
window.close();	// 쿠키 생성 후 윈도우 창 종료
</script>