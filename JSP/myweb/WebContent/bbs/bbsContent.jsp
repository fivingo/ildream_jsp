<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.bbs.BbsDTO" %>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO" scope="session"/>
<%
String bidx_s = request.getParameter("bidx");
if (bidx_s == null || bidx_s.equals("")) {
	bidx_s = "0";
}
int bidx = Integer.parseInt(bidx_s);
BbsDTO dto = bdao.bbsContent(bidx);

if (dto == null) {
%>
	<script>
	window.alert('삭제된 게시글이거나 잘못된 접근입니다.');
	location.href='bbsList.jsp';
	</script>
<%
	return;
}
bdao.readCount(bidx, dto.getBreadCount());	// 조회수 1씩증가
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dto.getBsubject() %></title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<script>
function pwdCheck(user) {
	if (user == 'up') {
		window.open('upPwdCheck.jsp?bidx=<%= dto.getBidx() %>&bwriter=<%= dto.getBwriter() %>&bsubject=<%= dto.getBsubject() %>&bcontent=<%= dto.getBcontent() %>', 'pweCheck', 'width=400, height=100, top=200, left=700');
	} else if (user == 'del') {
		window.open('delPwdCheck.jsp?bidx=<%= dto.getBidx() %>', 'pweCheck', 'width=400, height=100, top=200, left=700');
	}
}
</script>
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
<article>
<h2>자유게시판 본문</h2>
<table border="1" width="550" cellspacing="0">
<tr>
	<th>비번</th>
	<td align="left"><%= dto.getBpwd() %></td>
	<th>작성날짜</th>
	<td><%= dto.getBwriteDate() %></td>
<tr>
	<th>작성자</th>
	<td><%= dto.getBwriter() %></td>
	<th>조회 | 추천</th>
	<!-- 조회수 DB에 값은 들어갔지만 dto에 갱신은 안되서 + 1 -->
	<td><%= dto.getBreadCount() + 1 %> | <%= dto.getBrecommend() %></td>
</tr>
<tr>
	<th>제목</th>
	<td colspan="2"><%= dto.getBsubject() %></td>
	<td>
	<a href="bbsContentRecommend_ok.jsp?bidx=<%= dto.getBidx() %>&brec=<%= dto.getBrecommend() %>&user=up">추천</a> | 
	<a href="bbsContentRecommend_ok.jsp?bidx=<%= dto.getBidx() %>&brec=<%= dto.getBrecommend() %>&user=down">비추천</a></td>
</tr>
<tr height="250">
	<td colspan="4" valign="top" align="left">
	<!-- 글내용에 개행을 하게되면 \n은  적용이 안되므로 <br>태그 사용-->
	<!-- String.replaceAll(s1, s2): s1문자열을 s2문자열로 치환 -->
<%
	if (dto.getBcontent() == null) {
%>
		<%= dto.getBcontent() %>
<%				
	} else { // null이면 exception 발생
%>
		<%= dto.getBcontent().replaceAll("\n", "<br>") %>
<%
	}
%>
	</td>
</tr>
<tr>
	<td colspan="4" align="center"><a href="bbsList.jsp">목록으로</a> | 
	<a href="bbsReWrite.jsp?bsubject=<%= dto.getBsubject() %>
	&breference=<%= dto.getBreference() %>
	&blevel=<%= dto.getBlevel() %>
	&brank=<%= dto.getBrank() %>">답변쓰기</a> | 
	<a href="javascript:pwdCheck('up');">수정하기</a> |	
	<a href="javascript:pwdCheck('del');">삭제하기</a>
</tr>
</table>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>