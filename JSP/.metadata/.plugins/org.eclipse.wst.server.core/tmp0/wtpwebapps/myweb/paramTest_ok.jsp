<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest_ok</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<h2>넘어온 파라미터 확인</h2>
<% 	// Request 객체의 getPrameter(name) 메서드를 이용해 값 가져옴
	String name = request.getParameter("name"); 
	String pwd = request.getParameter("pwd"); 
	String se = request.getParameter("se"); 
	// 여러값은 배열이용 - getParameterValues(name) 메서드 이용
	String[] cbs = request.getParameterValues("cb");
%>
<h3>넘어온 이름값: <%= name %></h3>
<h3>넘어온 비번값: <%= pwd %></h3>
<h3>넘어온 성별값: <%= se %></h3>
<h3>넘어온 취미값: 
<%	// 유효성검사의 기본 형식 (배열이 있는가 || 배열에 데이터가 있는가)
	if (cbs == null || cbs.length == 0) {
		out.println("선택된 취미 없음");
	} else {
		for (int i = 0; i < cbs.length; i++) {
			out.println(cbs[i] + "&nbsp");
		}
	}
%>
</h3>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>