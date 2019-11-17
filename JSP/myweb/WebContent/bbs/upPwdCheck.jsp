<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script>
function updateSubmit() {
	opener.location.href='bbsContentUpdate.jsp';
	window.opener.name = "bbsContentUpdate.jsp";
	document.update.target = "bbsContentUpdate.jsp";
	document.update.action = "bbsContentUpdate.jsp";
	document.update.submit();
	window.self.close();
}
</script>
</head>
<%
String bidx_str = request.getParameter("bidx");
int bidx = Integer.parseInt(bidx_str);
String bwriter = request.getParameter("bwriter");
String bsubject = request.getParameter("bsubject");
String bcontent = request.getParameter("bcontent");
%>
<body>
<section>
<article>
<fieldset>
<legend>비밀번호 확인</legend>
<form name="update">
<input type="hidden" name="bidx" value="<%= bidx %>">
<input type="hidden" name="bwriter" value="<%= bwriter %>">
<input type="hidden" name="bsubject" value="<%= bsubject %>">
<input type="hidden" name="bcontent" value="<%= bcontent %>">
<input type="password" name="bpwd" required="required" placeholder="비밀번호">
<input type="button" value="확인" onclick="updateSubmit()">
</form>
</fieldset>
</article>
</section>
</body>
</html>