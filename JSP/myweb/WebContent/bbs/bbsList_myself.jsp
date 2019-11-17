<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="listo.bbs.*" %>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2 {
	text-align: center;
}
table {
	width: 550px;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
	border-spacing: 0px;
	margin: 0px auto;
	text-align: center;
}
table th {
	background-color: skyblue;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<h2>일단은 자유게시판</h2>
<section>
<article>
<table>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>글쓴이</th>
	<th>조회수</th>
</tr>
<%
ArrayList<BbsDTO> arr = bdao.bbsList_myself();
if (arr == null || arr.size() == 0) {
%>
	<tr>
	<td colspan="4" align="center">등록된 글 없음</td>
	</tr>
<%
} else {
	for (int i = 0; i < arr.size(); i++) {
%>
	<tr>
	<td><%= arr.get(i).getBidx() %></td>
	<td><a href="bbsContent.jsp?bidx=<%= arr.get(i).getBidx() %>"><%= arr.get(i).getBsubject() %></a></td>
	<td><%= arr.get(i).getBwriter() %></td>
	<td><%= arr.get(i).getBreadCount() %></td>
	</tr>
<%
	}
}
%>
<tr>
	<td colspan="4" align="right">
	<form name="bbsList">
	<input type="button" value="글쓰기" onclick="location.href='bbsWrite.jsp'">
	</form></td>
</tr>
</table>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>