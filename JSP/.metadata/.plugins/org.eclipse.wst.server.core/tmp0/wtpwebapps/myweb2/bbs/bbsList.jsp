<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자유게시판</h1>
<table border="1" width="550" cellspacing="0">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>조회</th>
<th>추천</th>
</tr>
</thead>
<tfoot>
<tr>
<td colspan="3" align="center">
<form name="search" action="bbsList.listo">
<select name="search_s">
	<option value="bsubject">제목</option>
	<option value="bcontent">본문</option>
	<option value="bwrite">작성자</option>
</select>
<input type="text" name="search_t" size="10px">
<input type="submit" value="검색">
</form>
<td>
${ requestScope.lists }
</td>
<td colspan="2" align="right">
<a href="bbsWrite.listo">글쓰기</a>
</tr>
</tfoot>
<tbody>
<%-- 게시물 리스트 --%>
<c:set var="arr" value="${ requestScope.arr }"/>
<c:choose>
	<c:when test="${ empty arr }">
		<tr><td colspan="5" align="center">등록된 게시글이 없습니다.</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="temp" items="${ arr }">
			<tr>
			<td>${ temp.bidx }</td>
			<c:url var="bbsContent" value="bbsContent.listo">
				<c:param name="bidx" value="${ temp.bidx }"/>			
			</c:url>
			<td>
			<c:forEach begin="1" end="${ temp.blevel }" step="1">
				&nbsp;&nbsp;	
			</c:forEach>
			<a href="${ bbsContent }">${ temp.bsubject }</a></td>
			<td>${ temp.bwriter }</td>
			<td>${ temp.breadCount }</td>
			<td>${ temp.brecommend }</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</tbody>
</table>
</body>
</html>