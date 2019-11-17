<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listo.bbs.BbsDTO" %>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO"/>
<%
String bidx_str = request.getParameter("bidx");
int bidx = Integer.parseInt(bidx_str);
String bpwd = request.getParameter("bpwd");
int result = bdao.deleteContent(bidx, bpwd);
if (result > 0) {
%>
	<script>
	window.alert('삭제되었습니다.');
	window.self.close();
	opener.location.href='bbsList.jsp';
	</script>
<%
} else if (result == 0){
%>
	<script>
	window.alert('비밀번호가 틀렸습니다.');
	window.self.close();
	</script>
<%
} else {
%>
	<script>
	window.alert('또 안됨 또 안됨 또 안됨 또 안됨 또 안됨');
	</script>
<%
}
%>
