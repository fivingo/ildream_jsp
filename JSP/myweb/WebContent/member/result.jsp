<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="listo.member.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="listo.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색 결과</title>
</head>
<body>
<%
String fKey = request.getParameter("fKey");
String fValue = request.getParameter("fValue");
%>
<table border="1" width="450">
<thead>
<tr>
	<th>번호</th>
	<th>ID</th>
	<th>이름</th>
	<th>비번</th>
	<th>메일</th>
	<th>주소</th>
	<th>시간</th>
			
</tr>
</thead>
<%	
ArrayList<MemberDTO> arr = dao.memberFind(fKey, fValue);
if (arr == null || arr.size() == 0) {
%>
<tr>
	<td colspan="7" align="center">회원없음</td>
</tr>
<%
} else {
	for (int i = 0; i < arr.size(); i++) {
%>
		<tr>
		<td><%= arr.get(i).getMidx() %></td>
		<td><%= arr.get(i).getMid() %></td>
		<td><%= arr.get(i).getMpwd() %></td>
		<td><%= arr.get(i).getMname() %></td>
		<td><%= arr.get(i).getMemail() %></td>
		<td><%= arr.get(i).getMaddr() %></td>
		<td><%= arr.get(i).getMjoinDate() %></td>
		</tr>
<%
	}
}
%>
</table>
</body>
</html>