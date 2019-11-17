<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색</title>
<link rel="stylesheet" type="text/css" href="/myweb/CSS/mainLayout.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
<article>
<h2>회원 검색</h2>
<!-- action 생략시 자기페이지로 전송 -->
<!-- 
- 기본접속방식(method)는 get
- 검색시 post방식으로 전송
-->
<form name="find" method="post">
<fieldset>
<legend>회원 검색</legend>
<select name="fKey">
	<option value="mid">ID</option>
	<option value="mname">이름</option>
</select>
<input type="text" name="fValue">
<input type="submit" value="검색">
</fieldset>
</form>
</article>
<hr>
<article>
<fieldset>
<legend>결과</legend>
<%
// 처음 접속(요청)시에는 GET방식
if (request.getMethod().equals("GET")) {
%>
	<h3>위 검색란에 검색어를 입력해주세요</h3>
<%
// 검색 value 전송(요청)시에는 POST방식으로
} else {
%>
	<jsp:include page="result.jsp"/>
<%
}
%>
</fieldset>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>