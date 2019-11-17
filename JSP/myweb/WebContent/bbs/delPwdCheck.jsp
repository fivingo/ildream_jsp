<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<%
String bidx_str = request.getParameter("bidx");
int bidx = Integer.parseInt(bidx_str);
%>
<body>
<section>
<article>
<fieldset>
<legend>비밀번호 확인</legend>
<form name="update" action="bbsContentDelete_ok.jsp">
<input type="hidden" name="bidx" value="<%= bidx %>">
<input type="password" name="bpwd" required="required" placeholder="비밀번호">
<input type="submit" value="확인">
</form>
</fieldset>
</article>
</section>
</body>
</html>