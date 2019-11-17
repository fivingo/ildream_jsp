<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdao" class="listo.guestbook.GuestDAO"/>
<%
String gidx_s = request.getParameter("gidx_del");
int gidx = Integer.parseInt(gidx_s);
int result = gdao.deleteContent(gidx);
String msg = result > 0 ? "삭제 되었습니다." : "아 또 안돼";
%>
<script>
window.alert('<%= msg %>');
location.href='guestBook.jsp';
</script>