<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="listo.wf.WebFolderService" scope="session"/>
<%
String crPath = request.getParameter("crPath");
String crPath_del = wf.USERS_HOME + "/" + request.getParameter("crPath");
File f = new File(crPath_del);
boolean result = false;
if (f.isDirectory()) {	// 폴더면 삭제 메서드 호출
	result = wf.deleteFolder(f);
} else {	// 파일이면 그냥 삭제
	result = f.delete();
}
// 실행 후 이전 경로로
int lastIndex = crPath.lastIndexOf("/");
String upCrPath = crPath.substring(0, lastIndex);
if (!result) {
%>
	<script>
	window.alert('오류 발생');
	location.href='webFolder.jsp?crPath=<%= upCrPath %>';
	</script>
<%
} else {
%>
	<script>
	window.alert('삭제 성공');
	location.href='webFolder.jsp?crPath=<%= upCrPath %>';
	</script>
<%
}
%>