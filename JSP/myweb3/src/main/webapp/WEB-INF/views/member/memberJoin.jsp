<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openIdCheck() {
	window.open('idCheck.do', 'check', 'width=400, height=200, top=200, left=700');
}
</script>
</head>
<body>
<h2>회원가입</h2>
<form name="memberJoin" action="memberJoin.do" method="post">
<table>
<tr>
<td>ID: </td>
<td><input type="text" name="mid" placeholder="중복검사하셈" readonly="readonly"></td>
<td><input type="button" name="idCheck" value="검사" onclick="openIdCheck()"></td>
</tr>
<tr>
<td>비밀번호: </td>
<td><input type="password" name="mpwd"></td>
</tr>
<tr>
<td>이름: </td>
<td><input type="text" name="mname"></td>
</tr>
<tr>
<td>E-mail: </td>
<td><input type="text" name="memail"></td>
</tr>
<tr>
<td>주소: </td>
<td><input type="text" name="maddr"></td>
</tr>
<tr>
<td><input type="submit" value="가입"></td>
<td><input type="reset" value="리셋"></td>
</tr>
</table>
</form>
</body>
</html>