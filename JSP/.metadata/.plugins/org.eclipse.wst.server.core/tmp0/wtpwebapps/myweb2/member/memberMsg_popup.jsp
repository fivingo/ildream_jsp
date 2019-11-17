<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg = (String) request.getAttribute("msg");
String userid = (String) request.getAttribute("userid");
if (userid == null) {
%>
	<script>
	window.alert('<%= msg %>');
	location.href = 'idCheck.listo';
	</script>
<%
} else {
%>
	<script>
	window.alert('<%= msg %>');
	opener.document.memberJoin.mid.value = '<%= userid %>';
	location.href = 'memberJoin.listo';
	self.close();
	</script>
<%
}
%>
