<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기</h1>
<form name="bbsWrite" action="bbsWrite.listo">
<table border="1" width="550" cellspacing="0">
<tr>
<th>작성자: </th>
<td><input type="text" name="bwriter"></td>
<th>비밀번호: </th>
<td><input type="password" name="bpwd"></td>
</tr>
<tr>
<th>제목: </th>
<td colspan="3"><input type="text" name="bsubject" size="65">
</tr>
<tr>
<td colspan="4"><textarea name="bcontent" rows="10" cols="65"></textarea>
</tr>
<tr>
<td colspan="4" align="center"><input type="submit" value="글쓰기">
<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</body>
</html>