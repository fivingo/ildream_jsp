<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO"/>
<%
String bidx_str = request.getParameter("bidx");
int bidx = Integer.parseInt(bidx_str);
String bpwd = request.getParameter("bpwd");
String bsubject = request.getParameter("bsubject");
String bcontent = request.getParameter("bcontent");

int result = bdao.updateContent(bidx, bpwd, bsubject, bcontent);
if (result > 0) {
%>
	<script>
	window.alert('수정되었습니다.');
	location.href='bbsContent.jsp?bidx=<%= bidx %>';
	</script>
<%
} else if (result == 0){
%>
	<script>
	window.alert('비밀번호가 틀렸습니다.');
	history.back;
	location.reload();
	</script>
<%
} else {
%>
	<script>
	window.alert('또 안됨 또 안됨 또 안됨 또 안됨 또 안됨');
	history.back;
	location.reload();
	</script>
<%
}
%>