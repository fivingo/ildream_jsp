<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="dto" value="${ requestScope.dto }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<article>
<h2>답변글쓰기</h2>
<form name="bbsReWrite" action="bbsReWrite.listo">
<input type="hidden" name="breference" value="${ dto.breference }">
<input type="hidden" name="blevel" value="${ dto.blevel }">
<input type="hidden" name="brank" value="${ dto.brank }">
<table border="1">
<tr>
<th>작성자: </th>
<td><input type="text" name="bwriter"></td>
<th>비밀번호: </th>
<td><input type="password" name="bpwd"></td>
</tr>
<tr>
<th>제목: </th>
<td colspan="3"><input type="text" name="bsubject" value="RE:${ dto.bsubject }" size="65">
</tr>
<tr>
<td colspan="4"><textarea name="bcontent" rows="10" cols="65"></textarea>
</tr>
<tr>
<td colspan="4"><input type="submit" value="글쓰기">
<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</article>
</section>
</body>
</html>