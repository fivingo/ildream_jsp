<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openIdCheck() {
	window.open('idCheck.listo', 'check', 'width=400, height=200, top=200, left=700');
}
</script>
</head>
<%
String userid = (String) request.getAttribute("userid");
if (userid == null) userid = "";
%>
<body>
<h1>회원가입</h1>
<form name="memberJoin" action="memberJoin.listo">
<table>
<tr>
	<th>ID: </th>
	<td><input type="text" name="mid" readonly="readonly" placeholder="중복검사"></td>
	<td><input type="button" name="check" value="검사" onclick="openIdCheck()"></td>
</tr>
<tr>
	<th>비밀번호: </th>
	<td colspan="2"><input type="password" name="mpwd"></td>
</tr>
<tr>
	<th>이름: </th>
	<td colspan="2"><input type="text" name="mname"></td>
</tr>
<tr>
	<th>E-mail: </th>
	<td colspan="2"><input type="text" name="memail"></td>
</tr>
<tr>
	<th>주소: </th>
	<td colspan="2"><input type="text" name="maddr"></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="가입">
	<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</body>
</html>