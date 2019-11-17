<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calculator</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
<style>
h2 {
	text-align: center;
}
fieldset {
	width: 450px;
	margin: 0px auto;
}
fieldset article {
	text-align: center;
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
<h2>사칙계산기</h2>
<form name="cal" action="cal_ok.jsp">
<fieldset>
<legend>계-산</legend>
<article>
<input type="text" name="num1" size="3px">
<select name="operator">
<option value="+">+</option>
<option value="-">-</option>
<option value="*">*</option>
<option value="/">/</option>
</select>
<input type="text" name="num2" size="3px">&nbsp;=&nbsp;&nbsp;
<input type="submit" value="계산">
</article>
</fieldset>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>