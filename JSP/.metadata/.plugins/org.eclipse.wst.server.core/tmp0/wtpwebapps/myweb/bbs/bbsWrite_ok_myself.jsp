<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="listo.bbs.BbsDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO"/>
<%
int result = bdao.bbsWrite(bdto);
if (result == -1) {
%>
	<script>
	window.alert('글작성 실패실패실패실패');
	location.href='bbsList.jsp';
	</script>
<%
} else {
%>
	<script>
	window.alert('글작성 성공');
	location.href='bbsList_paging.jsp';
	</script>
<%
}
%>