<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="listo.wf.WebFolderService" scope="session"/>
<%
String savePath = wf.USERS_HOME + "/" + wf.getCrPath();	// 폴더 생성 경로 지정
String folderName = request.getParameter("folderName");	// 지정한 폴더이름
File f = new File(savePath + "/" + folderName);
boolean result = f.mkdir();	// 폴더 생성 후 결과 반환
if (!result) {
%>
	<script>
	window.alert('오류 발생');
	window.self.close();
	</script>
<%
} else {
%>
	<script>
	window.alert('폴더 생성 성공');
	opener.location.href='webFolder.jsp?crPath=<%= wf.getCrPath() %>';
	window.self.close();
	</script>
<%
}
%>