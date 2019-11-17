<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="listo.guestbook.*" %>
<jsp:useBean id="gdao" class="listo.guestbook.GuestDAO"/>
<%
// 총 방명록 수
int totalCount = gdao.getTotalCount();

// 보여줄 리스트 수, 페이지 블록 크기
int listSize = 8;
int pageBlockSize = 1;

// 사용자의 현재 위치
String cPage_s = request.getParameter("cPage");
if (cPage_s == null || cPage_s.equals("")) {
	cPage_s = "1";
}
int cPage = Integer.parseInt(cPage_s);

//총 페이지 수
int totalPage = (totalCount / listSize) + 1;
if (totalCount % listSize == 0) {
	totalPage--;
}

//4-1. 그룹화
int userGroup = cPage / pageBlockSize;
if (cPage % pageBlockSize == 0) {
	userGroup--;
}

// 수정 파라미터값 얻기
String gidx_up_s = request.getParameter("gidx_up");
int gidx_up = 0;
if (gidx_up_s != null) {
	gidx_up_s = gidx_up_s.equals("null") ? null : gidx_up_s;
	gidx_up = Integer.parseInt(gidx_up_s);
}
String gcontent_up = request.getParameter("gcontent_up");
if (gcontent_up != null) gcontent_up = gidx_up_s.equals("null") ? null : gcontent_up;

// 검색 파라미터값 얻기
String search_id = request.getParameter("search_id");
%>
<%
// 로그인 세션 받아오기
String login_id = (String) session.getAttribute("login_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<script>
function openComBox(temp, id) {
	var com = document.getElementById(id);
	if (temp.className =='closed') {
		temp.className = 'opened';
		com.style.display ="block";
	} else {
		temp.className ='closed';
		com.style.display = "none";
	}
}
</script>
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
<article>
<h2>일단은 방명롹</h2>
<!-- 방명록 작성 -->
<%
if (login_id == null || login_id.equals("")) {
%>
	로그인 후 작성 가능합니다.
<%
} else {
%>
	<form name="write" action="guestBookWrite_ok.jsp">
	<div>[ <%= login_id %> ]<br>
	<input type="hidden" name="gid" value="<%= login_id %>">
	<input type="hidden" name="gipAddr" value="<%= request.getRemoteAddr() %>">
	<textarea name="gcontent" rows="5" cols="80" placeholder="네놈의 IP주소 <%= request.getRemoteAddr() %>"></textarea><br>
	<input type="submit" value="확인">
	</div>
	</form>
<%
}
%>
<hr>
<!-- 방명록 검색 -->
<form name="search" action="guestBook.jsp">
<div>
<input type="text" name ="search_id" placeholder="아이디">
<input type="submit" value="검색">
</div>
</form>
<%
// 기본 리스트
Vector<GuestDTO> v = gdao.guestList(cPage, listSize);
// 검색된 리스트
if (search_id != null) {
	v = gdao.guestSearch(cPage, listSize, search_id);
}

// 리스트 보이기
if (v == null || v.size() == 0) {
%>
	<div>등록된 게시글이 없습니다.</div>
<%
} else {
	for (int i = 0; i < v.size(); i++) {
%>
<%
		if (gidx_up != v.get(i).getGidx() && v.get(i).getGcomRef() == 0) {	// 수정 아닐시
			
%>
			<br><div><%= v.get(i).getGid() %> | <%= v.get(i).getGwriteDate() %> | <%= v.get(i).getGipAddr() %> 
			<a name="<%= i %>"><textarea rows="5" cols="80" style="border: 0; background-color: skyblue" readonly="readonly"><%= v.get(i).getGcontent() %></textarea></a><br>
<%
			if (v.get(i).getGid().equals(login_id)) {	// 아이디 같을때만 수정/삭제 가능
%>
			<a href="guestBook.jsp?gidx_up=<%= v.get(i).getGidx() %>&gcontent_up=<%= v.get(i).getGcontent() %>&cPage=<%= cPage %>#<%= i %>">수정</a>
			 | <a href="guestBookDelete_ok.jsp?gidx_del=<%= v.get(i).getGidx() %>">삭제</a> | 
<%
			}
%>
<%
			if (v.get(i).getGcomCount() > 0) {	// 댓글이 있을경우
				Vector<GuestDTO> v_com = gdao.guestListComment(v.get(i).getGidx());
%>
				<a class="closed" href="javascript:openComBox(this, 'comment_hidden<%= v.get(i).getGidx() %>');">댓글&nbsp;<%= v.get(i).getGcomCount() %></a>
				<form name="comment" action="guestBookComment_ok.jsp">
				<div id="comment_hidden<%= v.get(i).getGidx() %>" style="display: none">
<%
				for (int j = 0; j < v_com.size(); j++) {
%>
					[ <%= v_com.get(j).getGid() %> ]&nbsp;&nbsp;
					<span><%= v_com.get(j).getGcontent() %>&nbsp;</span><br>
<%
				}
%>
				<br>[ <%= login_id %> ]<br>
				<textarea name="gcontent" rows="1" cols="80" placeholder="댓글수정삭제불가"></textarea><br>
				<input type="hidden" name="gid" value="<%= login_id %>">
				<input type="hidden" name="gidx" value="<%= v.get(i).getGidx() %>">
				<input type="hidden" name="gcomRef" value="<%= v.get(i).getGcomRef() %>">
				<input type="hidden" name="gipAddr" value="<%= v.get(i).getGipAddr() %>">
				<input type="submit" value="확인">
				</div>
				</form>
<%
			} else {	// 댓글이 없을 경우
%>				
				<a class="closed" href="javascript:openComBox(this, 'comment_hidden<%= v.get(i).getGidx() %>');">댓글 쓰기</a>
				<form name="comment" action="guestBookComment_ok.jsp">
				<div id="comment_hidden<%= v.get(i).getGidx() %>" style="display: none">
				<br>[ <%= login_id %> ]<br>
				<textarea name="gcontent" rows="1" cols="80" placeholder="댓글수정삭제불가"></textarea><br>
				<input type="hidden" name="gid" value="<%= login_id %>">
				<input type="hidden" name="gidx" value="<%= v.get(i).getGidx() %>">
				<input type="hidden" name="gcomRef" value="<%= v.get(i).getGcomRef() %>">
				<input type="hidden" name="gipAddr" value="<%= v.get(i).getGipAddr() %>">
				<input type="submit" value="확인">
				</div>
				</form>
<%
			}
%>
			</div><br>
<%
		} else if (gidx_up != 0 && gcontent_up != null && gidx_up == v.get(i).getGidx()) {	// 수정시
%>	
			<br><div><%= v.get(i).getGid() %> | <%= v.get(i).getGwriteDate() %> | <%= v.get(i).getGipAddr() %> 
			<br><form name="update_c" action="guestBookUpdate_ok.jsp">
			<input type="hidden" name="gidx_up" value="<%= v.get(i).getGidx() %>">
			<a name="<%= i %>"><textarea name="gcontent_up" rows="5" cols="80"><%= v.get(i).getGcontent() %></textarea></a><br>
			<input type="submit" value="확인">
			<a href="guestBook.jsp?cPage=<%= cPage %>#<%= i %>"><input type="button" value="취소"></a>
			</form><br>
<%
		}
	}
}
%>
<hr>
<!-- 페이징 -->
<div>
<%
if (userGroup != 0) {
%>
	<a href="guestBook.jsp?cPage=<%= (userGroup - 1) * pageBlockSize + pageBlockSize %>">&triangleleft;이전</a>	
<%
}
%>
&nbsp;&nbsp;&nbsp;
<%
if (userGroup != (totalPage / pageBlockSize) - (totalPage % pageBlockSize == 0 ? 1 : 0)) {
%>
	<a href="guestBook.jsp?cPage=<%= (userGroup + 1) * pageBlockSize + 1 %>">다음&triangleright;</a>
<%
}
%>
<a href="#">&blacktriangle;TOP</a>
</div>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>