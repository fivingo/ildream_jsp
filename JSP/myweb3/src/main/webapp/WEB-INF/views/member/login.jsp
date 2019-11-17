<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<article>
<fieldset>
<legend>로그인</legend>
<form name="login" action="login.do" method="post">
<table>
<tr>
<th>ID </th>
<td><input type="text" name="userId" value="${ idMemory }"></td>
</tr>
<tr>
<th>비밀번호 </th>
<td><input type="password" name="userPwd"></td>
</tr>
<tr>
<td>
<input type="checkbox" name="idMemory" ${ idMemory_cb }>ID 기억
</td>
<td align="right">
<input type="submit" value="로그인">
</td>
</tr>
</table>
</form>
</fieldset>
</article>
</section>
</body>
</html>