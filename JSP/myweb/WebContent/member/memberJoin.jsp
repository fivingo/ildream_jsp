<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoin</title>
<link rel="stylesheet" type="text/css" href="/myweb/CSS/mainLayout.css">
<style>
h2 {
	text-align: center;
}
table {
	margin: 0px auto;
}
</style>
<script>
function openIdCheck() {
	window.open('idCheck.jsp', 'check', 'width=400, height=200, top=200, left=700');
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<h2>회원가입</h2>
<form name="join" action="memberJoin_ok.jsp">
<table>
<tr>
<td>ID:</td>
<td><input type="text" name="mid" readonly="readonly" required="required"></td>
<td><input type="button" name="idCheck" value="검사" onclick="openIdCheck()"></td>
</tr>
<tr>
<td>비밀번호:</td>
<td><input type="password" name="mpwd" required="required"></td>
</tr>
<tr>
<td>이름:</td>
<td><input type="text" name="mname" required="required"></td>
</tr>
<tr>
<td>E-mail:</td>
<td><input type="text" name="memail" required="required"></td>
</tr>
<tr>
<td>주소:</td>
<td><input type="text" name="maddr" required="required"></td>
</tr>
<tr align="center">
<td colspan="2"><input type="submit" value="가입">
<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>