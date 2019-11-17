<!-- 
디렉티브 (Directive): 설정정보를 지정
- page: JSP 페이지에 대한 정보를 지정
- include: JSP 페이지의 특정 영역에 다른 문서를 포함시킨다.

- page directive의 대표 속성
- contentType: JSP가 생성할 문서의 타입 지정
- import: JSP 페이지에서 사용할 자바 클래스 지정
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>오늘 첫번째로 만든거</h2>
</body>
</html>
