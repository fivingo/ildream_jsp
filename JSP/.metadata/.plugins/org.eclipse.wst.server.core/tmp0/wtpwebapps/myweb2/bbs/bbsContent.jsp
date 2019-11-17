<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="dto" value="${ requestScope.dto_c }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<article>
<h2>본문</h2>
<table border="1" width="550" cellspacing="0">
<tr>
<th>번호</th>
<td>${ dto.bidx }</td>
<th>작성일</th>
<td>${ dto.bwriteDate }</td>
</tr>
<tr>
<th>작성자</th>
<td>${ dto.bwriter }</td>
<th>조회 | 추천</th>
<td>${ dto.breadCount } | ${ dto.brecommend }</td>
</tr>
<tr>
<th>제목</th>
<td colspan="3">${ dto.bsubject }</td>
</tr>
<tr>
<td colspan="4">${ dto.bcontent }</td>
</tr>
<tr>
<td colspan="4">
<a href="bbsList.listo">목록</a> | 
<c:url var="bbsReWrite" value="bbsReWrite.listo">
	<c:param name="bsubject" value="${ dto.bsubject }"/>
	<c:param name="breference" value="${ dto.breference }"/>
	<c:param name="blevel" value="${ dto.blevel }"/>
	<c:param name="brank" value="${ dto.brank }"/>
</c:url>
<a href="${ bbsReWrite }">답글</a> | 
<a href="">수정</a> | 
<a href="">삭제</a>
</td>
</tr>
</table>
</article>
</section>
</body>
</html>