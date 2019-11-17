<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeTest_ok</title>
</head>
<body>
<h1>scopeTest_ok.jsp</h1>
<jsp:useBean id="stest" class="listo.bean.ScopeTest" scope="application"/>
<h3 style="color:red;">
count의 값: <jsp:getProperty property="count" name="stest"/></h3>
<a href="scopeTest.jsp">이전 페이지로..</a>
</body>
</html>