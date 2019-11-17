<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsWrite</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<h2>자유게시판 글쓰기</h2>
<form name="bbsWrite" action="bbsWrite_ok.jsp">
<table border="1" width="550px" cellspacing="0">
<tr>
	<th>작성자: </th>
	<td><input type="text" name="bwriter" required="required"></td>
	<th>비밀번호: </th>
	<td><input type="password" name="bpwd" required="required"></td>
</tr>
<tr>
	<th>제목: </th>
	<td colspan="3"><input type="text" name="bsubject" size="65" required="required"></td>
</tr>
<tr>
	<td>내용: </td>
	<td colspan="4"><textarea name="bcontent" rows="10" cols="65" required="required"></textarea></td>
</tr>
<tr>
	<td colspan="4" align="center"><input type="submit" value="글쓰기">
	<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>