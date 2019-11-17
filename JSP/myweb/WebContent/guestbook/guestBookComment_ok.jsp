<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdto" class="listo.guestbook.GuestDTO" scope="page"/>
<jsp:setProperty property="*" name="gdto"/>
<jsp:useBean id="gdao" class="listo.guestbook.GuestDAO" scope="session"/>
<%
int result = gdao.guestComment(gdto);
String msg = result > 0 ? "댓글쓰기 성공" : "댓글쓰기 실패";
%>
<script>
window.alert('<%= msg %>');
location.href='guestBook.jsp';
</script>