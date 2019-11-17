<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:inclue super</title>
</head>
<body>
<h6>
##jsp:inclue 액션태그:
- 화면 레이아웃의 일부분을 모듈화할 때 주로 사용 (페이지 추가)
- include 디렉티브와는 다르게 별도의 파일로 요청, 처리 흐름이 이동 (디렉티브는 코드 복사 삽입)
- request 기본 객체나 jsp:param을 이용해 파라미터 전달
- sub.jsp와 파라미터값 공유
- 주석 사용시 에러남 (한글문제?)
</h6>

<h1>super.jsp</h1>
<%
String str = "java";
%>
<h3 style="color: red;">super.jsp에서 출력한 문장 A</h3>
<h3 style="color: red;">super.jsp의 str의 값: <%= str %></h3>
<jsp:include page="sub.jsp">
	<jsp:param value="<%= str %>" name="str"/>
</jsp:include>
<h3 style="color: red;">super.jsp에서 출력한 문장 B</h3>
</body>
</html>