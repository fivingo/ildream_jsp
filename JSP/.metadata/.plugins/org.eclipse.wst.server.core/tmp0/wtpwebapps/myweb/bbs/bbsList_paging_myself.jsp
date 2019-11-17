<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="listo.bbs.*" %>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판_paging</title>
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
<%
// 선택된 페이지
String selectedPage_str = request.getParameter("selectedPage");
if (selectedPage_str == null || selectedPage_str.equals("")) {
	selectedPage_str = "1";
}
int selectedPage = Integer.parseInt(selectedPage_str) - 1;
// 페이지 블록
String pageBlock_str = request.getParameter("pageBlock");
if (pageBlock_str == null || pageBlock_str.equals("")) {
	pageBlock_str = "1";
}
int pageBlock = Integer.parseInt(pageBlock_str);
%>
<body>
<%@ include file="/header.jsp" %>
<h2>일단은 자유게시판 페이징</h2>
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
int numberPerPage = 3;	// 한 페이지당 글 개수
ArrayList<BbsDTO> arr = bdao.bbsList_myself();
ArrayList<BbsDTO[]> arr_paging = bdao.bbsListPaging(arr, numberPerPage);
if (arr == null || arr.size() == 0) {
%>
	<tr>
	<td colspan="4" align="center">등록된 글 없음</td>
	</tr>
<%
} else {
	for (int i = 0; i < arr_paging.get(selectedPage).length; i++) {
%>
		<tr>
<%
		if (arr_paging.get(selectedPage)[i] != null) {
%>
			<td><%= arr_paging.get(selectedPage)[i].getBidx() %></td>
			<td><a href="bbsContent.jsp?bidx=<%= arr_paging.get(selectedPage)[i].getBidx() %>"><%= arr_paging.get(selectedPage)[i].getBsubject() %></a></td>
			<td><%= arr_paging.get(selectedPage)[i].getBwriter() %></td>
			<td><%= arr_paging.get(selectedPage)[i].getBreadCount() %></td>
<%
		}
%>
		</tr>
<%
	}
}
%>
<tr>
	<td colspan="3">
<%
int pageNumber = (arr.size() / numberPerPage) + 1;	// 페이지 수
if (pageNumber >= 6) {	// 페이지 수 6이상
	if ((pageBlock + 4) > 5) {	// 일단 조건은 됨
%>
		<a href="bbsList_paging.jsp?pageBlock=<%= pageBlock - 5 %>&selectedPage=<%= pageBlock - 1 %>"><<</a>
<%		
	}
	for (int i = pageBlock; i < ((pageBlock + 5 < pageNumber) ? pageBlock + 5 : pageNumber); i++) {
		if (selectedPage == i - 1) {
%>
			<a href="bbsList_paging.jsp?selectedPage=<%= i %>&pageBlock=<%= pageBlock %>">[ <%= i %> ]</a>
<%
		} else {
%>
			<a href="bbsList_paging.jsp?selectedPage=<%= i %>&pageBlock=<%= pageBlock %>"><%= i %></a>
<%			
		}
	}
	if ((pageBlock + 4) < pageNumber) {
%>
		<a href="bbsList_paging.jsp?pageBlock=<%= pageBlock + 5 %>&selectedPage=<%= pageBlock + 5 %>">>></a>
<%
	}
} else {	// 페이지 수 5미만
	for (int i = 1; i <= pageNumber; i++) {
		if (selectedPage == i - 1) {
%>
			<a href="bbsList_paging.jsp?selectedPage=<%= i %>">[ <%= i %> ]</a>
<%
		} else {
%>
			<a href="bbsList_paging.jsp?selectedPage=<%= i %>"> <%= i %> </a>
<%			
		}
	}
}
%>
	</td>
	<td align="right">
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