<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdto" class="listo.guestbook.GuestDTO"/>
<jsp:setProperty property="*" name="gdto"/>
<jsp:useBean id="gdao" class="listo.guestbook.GuestDAO"/>
<%
int result = gdao.guestWrite(gdto);
String msg = result > 0 ? "방명록 작성 성공" : "또 실패 또";
%>
<script>
window.alert('<%= msg %>');
location.href='guestBook.jsp';
</script>