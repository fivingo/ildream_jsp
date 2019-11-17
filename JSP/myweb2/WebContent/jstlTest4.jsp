<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest4</title>
</head>
<body>
<h1>jstlTest4.jsp</h1>
<%-- 예외처리 태그 --%>
<c:catch var="errorInfo">
<%
String str = null;
out.println(str.toString());
%>
</c:catch>
<h3>${ errorInfo }</h3>
bbsContent.jsp?idx=10&cp=5&level=6<br>
<%-- 주소창을 통한 파라미터값 전달 태그 (오타방지에 유용) --%>
<c:url var="bbsContent" value="bbsContent.jsp">
	<c:param name="idx">10</c:param>
	<c:param name="cp">5</c:param>
	<c:param name="level">6</c:param>
</c:url>
${ bbsContent }
<%-- 지정한 주소 페이지 추가 태그 --%>
<c:import url="https://m.naver.com" var="mnaver"/>
<div style="width: 450px; height: 450px; border: 2px solid gray; overflow: hidden;">
${ mnaver }
</div>
</body>
</html>