<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebFolder</title>
<link rel="stylesheet" type="text/css" href="/myweb/CSS/mainLayout.css">
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
meter {
	width: 200px;
}
label {
	width: 80px;
	float: left;
}
</style>
</head>
<%
// 로그인 세션 받아오고 유효성 검사
String login_id = (String) session.getAttribute("login_id");
if (login_id == null || login_id.equals("")) {
%>
	<script>
	window.alert("로그인 후 이용가능합니다.");
	location.href='/myweb';	// 비로그인시 홈으로
	</script>
<%
	return;	// 나머지 기능(페이지)을 종료
}
%>
<script>
function openFileUpload() {
	window.open('fileUpload.jsp', 'fileUpload', 'width=450, height=100, top=150, left=350');
}
function openFolderCreate() {
	window.open('folderCreate.jsp', 'folderCreate', 'width=450, height=100, top=150, left=350');
}
</script>
<jsp:useBean id="wf" class="listo.wf.WebFolderService" scope="session"/>
<%
wf.setUserId(login_id);		// 세션의 값(id) userId에 저장
wf.getUserFolderExists();	// 폴더 유무 확인 메서드

// 사용자 id를 경로로 지정
String crPath = request.getParameter("crPath");	// 폴더 경로 수정하면서 넘기는 crPath의 파라미터값을 받음
if (crPath == null || crPath.equals("")) {
	crPath = login_id;
}
wf.setCrPath(crPath);	// id를 crPath에 저장
%>
<body>
<%@ include file="/header.jsp" %>
<section>
<article>
<!-- header.jsp를 include 했으므로 userName 가능 -->
<h2><%= userName %>님의 LIstorive</h2>
<fieldset>
<legend>기본정보</legend>
<ul>
	<!-- 그래프(%) -->
	<li><label>총 용량: </label>
	<meter value="<%= wf.getTotalSize() %>" min="0" max="<%= wf.getTotalSize() %>"></meter>
	<%= wf.getTotalSize() %> byte</li>
	<li><label>사용 용량: </label>
	<meter value="<%= wf.getUsedSize() %>" min="0" max="<%= wf.getTotalSize() %>"></meter>
	<%= wf.getUsedSize() %> byte</li>
	<li><label>남은 용량: </label>
	<meter value="<%= wf.getFreeSize() %>" min="0" max="<%= wf.getTotalSize() %>"></meter>
	<%= wf.getFreeSize() %> byte</li>
</ul>
</fieldset>
</article>
<hr>
<article>
<div>
<input type="button" value="파일 업로드" onclick="openFileUpload()">
<input type="button" value="폴더 생성" onclick="openFolderCreate()">
</div>
<div>
<table>
<thead>
<tr>
	<th>분류</th>
	<th>폴더 및 파일명</th>
	<th>삭제</th>
</tr>
</thead>
<tbody>
<%
// 하위폴더에서 상위폴더로
if (!wf.getCrPath().equals(wf.getUserId())) {
	// lastIndex(ch): 지정한 문자가 있는 마지막 위치의 인덱스 반환
	int lastIndex = wf.getCrPath().lastIndexOf("/");
	// substring(i1, i2): 지정한 인덱스1부터 인덱스2 전까지의 문자열 반환
	String upCrPath = wf.getCrPath().substring(0, lastIndex);
%>
	<tr>
	<td colspan="3" align="center">
	<!-- 수정된 문자열(경로)를  crPath의 파라미터값으로 -->
	<a href="webFolder.jsp?crPath=<%= upCrPath %>">상위로..</a>
	</tr>
<%
}
%>
<%
// 폴더 리스트 출력 구문
File[] files = wf.getFileList();	// crPath에 저장된 경로의 폴더 리스트
if (files == null || files.length == 0) {
%>
	<tr>
	<td colspan="3" align="center">파일 및 폴더가 없습니다</td>
	</tr>
<%
}
for (int i = 0; i < files.length; i++) {
%>
	<tr><!-- 종류 판단 -->
	<td><%= files[i].isFile() ? "[FILE]" : "[DIR]" %></td>
	<td>
<%
	if (files[i].isFile()) {	// 파일
%>
	<!-- 링크를 파일의 경로로 지정하면 다운로드 가능: 기본폴더/사용자의 id/파일명 -->
	<a href="/myweb/wf/upload/<%= wf.getCrPath() %>/<%= files[i].getName() %>">
	<%= files[i].getName() %></a>
<%
	} else {	// 폴더
%>
	<!-- 
	- 링크를 폴더의 경로를 파라미터값으로 넘기며 지정 -> ?[parameter]=[value(경로)]
	- 폴더 이름을 기존 경로 뒤에 추가하여 새로운 경로로 만든다 -> bean의 scope속성이 session이므로 계속 유지
	 -->
	<a href="webFolder.jsp?crPath=<%= wf.getCrPath() %>/<%= files[i].getName()%>">
	<%= files[i].getName() %></a>
<%
	}
%>
	</td>
	<td><a href="delete_ok.jsp?crPath=<%= wf.getCrPath() %>/<%= files[i].getName() %>">삭제</a></td>
	</tr>		
<%
}
%>
</tbody>
</table>
</div>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>