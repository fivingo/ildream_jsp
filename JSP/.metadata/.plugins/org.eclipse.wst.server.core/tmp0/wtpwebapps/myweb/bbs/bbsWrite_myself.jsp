<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2 {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<h2>일단은 글쓰기</h2>
<section>
<article>
<form name="bbsWrite" action="bbsWrite_ok.jsp">
<table>
<tr>
	<td>글쓴이: </td>
	<td><input type="text" name="bwriter"></td>
	<td>비밀번호: </td>
	<td><input type="password" name="bpwd"></td>
</tr>
<tr>
	<td>제목: </td>
	<td colspan="3"><input type="text" name="bsubject" size="58"></td>
</tr>
<tr>
	<td>내용: </td>
	<td colspan="3"><textarea name="bcontent" rows="20" cols="60"></textarea></td>
</tr>
<tr>
	<td colspan="4" align="right"><input type="submit" value="작성">
	<input type="reset" value="다시"></td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>