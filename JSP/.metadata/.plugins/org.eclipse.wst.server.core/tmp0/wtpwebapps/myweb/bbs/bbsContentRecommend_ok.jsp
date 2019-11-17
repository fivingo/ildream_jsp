<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="listo.bbs.BbsDAO" scope="session"/>
<%
String bidx_s = request.getParameter("bidx");
int bidx = Integer.parseInt(bidx_s);
String brec_s = request.getParameter("brec");
int brec = Integer.parseInt(brec_s);
String user = request.getParameter("user");

int result = bdao.ContentRecommend(bidx, brec, user);
String msg =  result > 0 ? (user.equals("up") ? "추천 되었습니다" : "비추천 되었습니다") : "또 오류 발생 ㅅㅂ";
%>
<script>
window.alert('<%= msg %>');
location.href='bbsContent.jsp?bidx=<%= bidx %>';
</script>