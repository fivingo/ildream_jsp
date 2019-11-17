<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeTest</title>
</head>
<body>
<h1>scopeTest.jsp</h1>
<jsp:useBean id="stest" class="listo.bean.ScopeTest" scope="application"/>
<jsp:setProperty property="count" name="stest"/>
<h3 style="color:blue;">
count의 값: <jsp:getProperty property="count" name="stest"/></h3>
<a href="scopeTest_ok.jsp">다음 페이지로..</a>
</body>
</html>