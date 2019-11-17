<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.bbs.BbsDTO"%>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO"/>
<%
int bidx = Integer.parseInt(request.getParameter("bidx"));
BbsDTO dto = bdao.bbsContent(bidx);
bdao.readCount(bidx, dto.getBreadCount());	// 조회수 1씩증가
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dto.getBsubject() %></title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
table {
	margin: 0px auto;
}
</style>
<script>
function updatePopup() {
	window.open('bbsContentUpdate.jsp?bidx=<%= dto.getBidx() %>', 'update', 'width=400, height=100, top=200, left=700');
}
function deletePopup() {
	window.open('bbsContentDelete.jsp?bidx=<%= dto.getBidx() %>', 'delete', 'width=400, height=100, top=200, left=700');
}
</script>
</head>
<body>
<%@ include file="/header.jsp" %>
<h2 align="center">일단 본문내용</h2>
<section>
<article>
<form name="bbsContent">
<table border="1">
<tr>
	<td>번호: <%= dto.getBidx() %></td>
	<td colspan="2">글쓴이: <%= dto.getBwriter() %></td>
	<td>비밀번호: <%= dto.getBpwd() %></td>
</tr>
<tr>
	<td colspan="4">제목: <%= dto.getBsubject() %></td>
</tr>
<tr>
	<td colspan="4">내용: <br><%= dto.getBcontent() %></td>
</tr>
<tr>
	<td colspan="4">
	<!-- 기존페이지 보이게? -->
	<input type="button" value="목록" onclick="location.href='bbsList_paging.jsp'">
	<input type="button" value="수정" onclick="javascript:updatePopup()">
	<input type="button" value="삭제" onclick="javascript:deletePopup()">
	</td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>