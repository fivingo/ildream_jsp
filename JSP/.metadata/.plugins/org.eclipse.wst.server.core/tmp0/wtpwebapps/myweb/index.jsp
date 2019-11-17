<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 제이에스피</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
function popupNotice() {
	window.open('popup.jsp', 'popup', 'width=240, height=290, top=210, left=320');
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<article id="mainImg">	<!-- 블록 태그 속성 -->
<img src="IMG/main.gif" alt="메인이미지">
</article>
<article id="mainMenu">
<h2>&nbsp;&nbsp;안녕하세요. ㅎㅇㅎㅇ?</h2>
<%
// 쿠키 불러오기 - 방문일: 기존 저장된 정보를 불러오기위해 저장보다 먼저 실행되게 위에
Cookie[] cks = request.getCookies();	// 1. 쿠키'들'을 가져오기 
String lastDate = "&nbsp;&nbsp;&nbsp;&nbsp;처음 오셨네요.";
if (cks != null) {
	for (int i = 0; i < cks.length; i++) {
		// 2. 원하는 key 찾기: lastDate key 검색, 있으면 메세지 변경
		if (cks[i].getName().equals("lastDate")) {
			lastDate = "&nbsp;&nbsp;&nbsp;&nbsp;최근방문일: "
					+ URLDecoder.decode(cks[i].getValue());	// 3. value 추출
		}
	}
}

// 쿠키 불러오기 - 공지팝업창
boolean cookie_check = true;
if (cks != null) {
	for (int i = 0; i < cks.length; i++) {
		// 2. 원하는 key 찾기: notice key 검색,있으면 false
		if (cks[i].getName().equals("notice")) {
			cookie_check = false;
		}
	}
}
if (cookie_check) {	// 3. 값 활용: notice 쿠키 유무에 따라 실행여부 판단
%>
	<script>
	popupNotice();
	</script>	
<%
}
%>
<h4><%= lastDate %></h4>
<%
// 오늘 날짜 구하기
Calendar cal = Calendar.getInstance();
String year = Integer.toString(cal.get(cal.YEAR));
String month = Integer.toString(cal.get(cal.MONTH) + 1);
String day = Integer.toString(cal.get(cal.DATE));
String date = year + "년 " + month + "월 " + day + "일";
date = URLEncoder.encode(date);

// 쿠키 저장하기 - 방문일
Cookie ck = new Cookie("lastDate", date);	// 1. 쿠키 객체 생성
ck.setMaxAge(60 * 60 * 24 * 30);			// 2. 쿠키 나이 지정 (초)
response.addCookie(ck);						// 3. 브라우저(클라이언트)에 추가
%>
<ul>
	<li>수업메뉴가 아래에 계속 추가됨</li>
	<li><a href="paramTest.jsp">파라미터 테스트</a></li>
	<li><a href="cal.jsp">사칙계산기</a></li>
	<li><a href="emp.jsp">사원관리 프로그램 (model1)</a></li>
	<li><a href="beanTest.jsp">빈테스트</a></li>
	<li><a href="emp2.jsp">사원관리 프로그램 (Beans 적용)</a></li>
	<li><a href="member/memberFind.jsp">회원검색</a></li>
</ul>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>