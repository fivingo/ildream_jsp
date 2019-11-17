<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
</head>
<%
String bidx_str = request.getParameter("bidx");
int bidx = Integer.parseInt(bidx_str);
String bpwd = request.getParameter("bpwd");
String bwriter = request.getParameter("bwriter");
String bsubject = request.getParameter("bsubject");
String bcontent = request.getParameter("bcontent");
%>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<h2>자유게시판 글 수정</h2>
<form name="bbsWrite" action="bbsContentUpdate_ok.jsp">
<table border="1" width="550px" cellspacing="0">
<tr>
	<th>작성자: </th>
	<td colspan="2"><input type="text" name="bwriter" value="<%= bwriter %>" readonly="readonly" required="required">
	<input type="hidden" name="bidx" value="<%= bidx %>" required="required">
	<input type="hidden" name="bpwd" value="<%= bpwd %>" required="required"></td>
</tr>
<tr>
	<th>제목: </th>
	<td colspan="3"><input type="text" name="bsubject" value=<%= bsubject %> size="65" required="required"></td>
</tr>
<tr>
	<td>내용: </td>
	<td colspan="4"><textarea name="bcontent" rows="10" cols="65" required="required"><%= bcontent %></textarea></td>
</tr>
<tr>
	<td colspan="4" align="center"><input type="submit" value="수정">
	<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>