<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieTest.jsp</h1>
<%
// 쿠키 불러오기
Cookie[] cks = request.getCookies();	// 1. 쿠키'들'을 가져오기
if (cks != null) {
	for (int i = 0; i < cks.length; i++) {	// 2. 원하는 key 찾기
		String key = cks[i].getName();		// 3. value 추출
		String value = URLDecoder.decode(cks[i].getValue());
		out.println("<h3>key: " + key + " / value: " + value + "</h3>");
	}
}
%>

<hr>
<%
// cookie의 value는 공백 허용x -> 유니코드로 변경
// URLEncoder.encode(s), URLDecoder.decode(s)
String name="홍 길동";
name = URLEncoder.encode(name);
// 쿠키 저장하기
Cookie ck1 = new Cookie("name", name);	// 1. 쿠키 객체 생성
ck1.setMaxAge(60 * 3);					// 2. 쿠키 나이 지정 (초)
response.addCookie(ck1);				// 3. 브라우저(클라이언트)에 추가

Cookie ck2 = new Cookie("age", "20");	// 1. 쿠키 객체 생성
ck2.setMaxAge(60);						// 2. 쿠키 나이 지정 (초)
response.addCookie(ck2);				// 3. 브라우저(클라이언트)에 추가
%>
</body>
</html>