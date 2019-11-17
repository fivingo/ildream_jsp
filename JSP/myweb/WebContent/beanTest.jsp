<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
<style>
h2 {
	text-align: center;
}
fieldset {
	width: 450px;
	margin: 0px auto;
}
fieldset li {
	list-style-type: none;
}
label {
	width: 80px;	/* width - 블록태그만 적용됨*/
	float: Left;
}
fieldset p {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<h2>beanTest.jsp</h2>
<article>
<form name="fm" action="beanTest_ok.jsp">
<table>
<tr>
<td>이름: </td><td><input type="text" name="name"></td>
</tr>
<tr>
<td>나이: </td><td><input type="text" name="age"></td>
</tr>
<tr>
<td>주소: </td><td><input type="text" name="addr"></td>
</tr>
<tr>
<td>전번: </td><td><input type="text" name="phone"></td>
</tr>
<tr>
<td><input type="submit" value="전달">
</tr>
</table>
</form>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
