<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<%
// id기억 cookie 확인
String idMemory = "";
String idMemory_cb = null;

Cookie[] cks = request.getCookies();
if (cks != null) {
	for (int i = 0; i < cks.length; i++) {
		if (cks[i].getName().equals("idMemory")) {
			idMemory_cb = "checked";		// checked 속성으로
			idMemory = cks[i].getValue();	// 로그인 아이디 기억
		}
	}
}
%>
<body>
<form name="login" action="login_ok.jsp">
<fieldset>
<legend>로그인</legend>
<table>
<tr>
<th>ID: </th>
<td><input type="text" name="mid" value="<%= idMemory%>" required="required"></td>
</tr>
<tr>
<th>PW: </th>
<td><input type="password" name="mpwd" required="required"></td>
</tr>
<tr>
<td><input type="checkBox" name="idMemory" <%= idMemory_cb %>>ID기억
<td align="right"><input type="submit" value="로그인"></td>
</tr>
</table>
</fieldset>
</form>
</body>
</html>