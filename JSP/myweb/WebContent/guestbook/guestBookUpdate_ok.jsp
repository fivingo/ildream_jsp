<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdao" class="listo.guestbook.GuestDAO"/>
<%
String gidx_s = request.getParameter("gidx_up");
int gidx = Integer.parseInt(gidx_s);
String gcontent = request.getParameter("gcontent_up");
int result = gdao.updateContent(gidx, gcontent);
String msg = result > 0 ? "수정 되었습니다." : "아 또 안돼 ㅅㅂ";
%>
<script>
window.alert('<%= msg %>');
location.href='guestBook.jsp';
</script>