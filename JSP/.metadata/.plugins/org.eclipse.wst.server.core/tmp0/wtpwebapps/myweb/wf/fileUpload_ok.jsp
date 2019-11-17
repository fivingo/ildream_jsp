<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="listo.wf.WebFolderService" scope="session"/>
<%
String savePath = wf.USERS_HOME + "/" + wf.getCrPath();
try {
	/*
	MultipartRequest: COS 패키지에 포함되어있는 파일 업로드 컴포넌트
	[생성자] 
	MultipartRequest mr = new MultipartRequest(
								HttpServletRequest request,	// request 객체 (필수)
								String saveDirectory,		// 파일 저장 경로 (필수)
								int maxPostSize,			// 파일 최대 크기 (필수?)
								String encoding,			// 인코딩타입
								FileRenamePolicy policy)	// 파일작명정책
	*/
	MultipartRequest mr = 
			new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");
} catch (Exception e) {
%>
	<script>
	window.alert('용량이 초과되거나 알수없는 오류 발생');
	window.self.close();
	</script>
<%
}
%>
<script>
window.alert('파일 업로드 성공');
opener.location.href='webFolder.jsp?crPath=<%= wf.getCrPath() %>';
window.self.close();
</script>