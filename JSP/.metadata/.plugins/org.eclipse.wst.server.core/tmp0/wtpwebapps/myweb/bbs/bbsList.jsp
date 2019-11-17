<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="listo.bbs.*" %>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO" scope="session"/>
<%
// 검색이나 정렬 파라미터값 얻기
String search_s = request.getParameter("search_s");
if (search_s != null) search_s = search_s.equals("null") ? null : search_s;
String search_t = request.getParameter("search_t");
if (search_t == null) search_t = "";
String sort = request.getParameter("sort");

// 1. 총 게시물 수
int totalCount = bdao.getTotalCount();	// DB를 통해 총 게시물 수 받기
// 검색된 총 게시물 수
if (search_s != null && search_t != null) {
	totalCount = bdao.getTotalCount_search(search_s, search_t);
}

// 2.3. 보여줄 리스트 수, 페이지 블록 크기 (임의지정가능)
int listSize = 20;
int pageBlockSize = 5;

// 4. 사용자의 현재 위치(선택한 페이지)
String cPage_s = request.getParameter("cPage");
if (cPage_s == null || cPage_s.equals("")) {
	cPage_s = "1";
}
int cPage = Integer.parseInt(cPage_s);

// 총 페이지 수
int totalPage = (totalCount / listSize) + 1;
if (totalCount % listSize == 0) {
	totalPage--;
}

// 4-1. 그룹화
int userGroup = cPage / pageBlockSize;
if (cPage % pageBlockSize == 0) {
	userGroup--;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsList</title>
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
}
table th {
	background-color: skyblue;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<h2>자 유 게 시 판</h2>
<section>
<article>
<table>
<thead>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회<a href="bbsList.jsp?sort=breadcount&search_s=<%= search_s %>&search_t=<%= search_t %>">&Del;</a></th>
	<th>추천<a href="bbsList.jsp?sort=brecommend&search_s=<%= search_s %>&search_t=<%= search_t %>">&Del;</a></th>
</tr>
</thead>
<tfoot>
<tr>
	<td colspan="5" align="center">
<%
// <<
if (userGroup != 0) {
%>
	<a href="bbsList.jsp?cPage=<%= (userGroup - 1) * pageBlockSize + pageBlockSize %>">&lt;&lt;</a>	
<%
}
%>
<%
// 4-2. 그룹화 후 블록 보이기
for (int i = (userGroup * pageBlockSize + 1); i <= (userGroup * pageBlockSize + pageBlockSize); i++) {
	if (search_s != null && search_t != null) {	// 게시물 검색시
%>
		&nbsp;<a href="bbsList.jsp?cPage=<%= i %>&search_s=<%= search_s %>&search_t=<%= search_t %>"><%= i %></a>&nbsp;
<%
	} else {	// 검색 아닐시
%>
		&nbsp;<a href="bbsList.jsp?cPage=<%= i %>"><%= i %></a>&nbsp;
<%
	}
	if (i == totalPage) break;
}
%>
<%
// >>
if (userGroup != (totalPage / pageBlockSize) - (totalPage % 5 == 0 ? 1 : 0)) {
%>
	<a href="bbsList.jsp?cPage=<%= (userGroup + 1) * pageBlockSize + 1 %>">&gt;&gt;</a>
<%
}
%>
	</td>
</tr>
<tr>
	<td colspan="3">
	<form name="search" action="bbsList.jsp">
	<select name="search_s">
		<option value="bsubject">제목</option>
		<option value="bcontent">본문</option>
		<option value="bwriter">작성자</option>
	</select>
	<input type="text" name="search_t" value="<%= search_t %>" size="10px">
	<input type="submit" value="검색">
	</form>
	</td>
	<td colspan="2" align="right">
	<a href="bbsWrite.jsp">글쓰기</a>
	</td>
</tr>
</tfoot>
<tbody>
<%
// 기본적인 보여줄 리스트 DB로부터 받아오기
ArrayList <BbsDTO> arr = bdao.bbsList(cPage, listSize);

// 검색된 리스트 DB로부터 받아오기
if (search_s != null && search_t != null) {
	arr = bdao.listSearch(cPage, listSize, search_s, search_t);
}
// 정렬된 기본 리스트 DB로부터 받아오기
if (sort != null) {
	arr = bdao.bbsListSort(cPage, listSize, sort);
}
// 정렬된 검색 리스트 DB로부터 받아오기
if (search_s != null && search_t != null && sort != null) {
	arr = bdao.listSearchSort(cPage, listSize, search_s, search_t, sort);
}
if (arr == null || arr.size() == 0) {
%>
	<tr>
	<td colspan="4" align="center">등록된 게시글이 없습니다.
	</tr>
<%
} else {
	for (int i = 0; i < arr.size(); i++) {
%>
		<tr>
		<td align="center"><%= arr.get(i).getBidx() %></td><!-- 번호 -->
		<td>
<%
		for (int z = 1; z <= arr.get(i).getBlevel(); z++) {	// 답변 공백
			out.println("&nbsp;&nbsp;");
		}
%>
		<!-- 글제목 선택시 bidx의 파라미터값 전달 -->
		<a href="bbsContent.jsp?bidx=<%= arr.get(i).getBidx() %>">
		<%= arr.get(i).getBsubject() %></a></td><!-- 제목 -->
		<td align="center"><%= arr.get(i).getBwriter() %></td><!-- 작성자 -->
		<td align="center"><%= arr.get(i).getBreadCount() %></td><!-- 조회수 -->
		<td align="center"><%= arr.get(i).getBrecommend() %></td><!-- 추천수 -->
		</tr>
<%
	}
}
%>
</tbody>
</table>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>