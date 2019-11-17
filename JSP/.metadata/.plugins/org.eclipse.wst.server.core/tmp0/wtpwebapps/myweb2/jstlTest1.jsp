<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest1</title>
</head>
<body>
<h1>jstlTest1.jsp</h1>
<%-- 변수 설정 태그 두가지 형식 --%>
<c:set var="num1" value="100"/>
<c:set var="num2">200</c:set>
<h3>num1: ${ num1 }</h3>
<h3>num2: ${ num2 }</h3>
<h3>num1 + num2 = ${ num1 + num2 }</h3>
<%
String[] fruit = {"사과", "배", "포도", "딸기" };
%>
<%-- 배열변수 설정 태그 --%>
<c:set var="f" value="<%= fruit %>"/>
<ul>
	<li>${ f }</li>
	<li>${ f[0] }</li>
	<li>${ f["1"] }</li>
	<li>${ f['2'] }</li>
	<li>${ f[3] }</li>
</ul>
<hr>
<%-- 설정한 변수 제거 태그 --%>
<c:remove var="f"/>
<ul>
	<li>${ f }</li>
	<li>${ f[0] }</li>
	<li>${ f["1"] }</li>
	<li>${ f['2'] }</li>
	<li>${ f[3] }</li>
</ul>
<hr>
<%
HashMap map = new HashMap();
%>
<%-- 객체 변수 설정 태그와 객체의 property값 지정 두가지 형식 --%>
<c:set var="m" value="<%= map %>"></c:set>
<c:set target="${ m }" property="id" value="hong"/>
<c:set target="${ m }" property="name">홍길동</c:set>
<c:set target="${ m }" property="user-pwd" value="1234"/>
<%-- 객체의 property값 표현 두가지 형식 --%>
<h3>아이디: ${ m.id }</h3>
<h3>이름: ${ m.name }</h3>
<hr>
<h3>아이디: ${ m['id'] }</h3>
<h3>이름: ${ m['name']  }</h3>
<h3>비밀번호: ${ m['user-pwd'] }</h3>
</body>
</html>