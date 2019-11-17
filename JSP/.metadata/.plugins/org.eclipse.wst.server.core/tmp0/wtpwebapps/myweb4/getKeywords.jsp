<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String keywords[] = {"java 기초", "jsp기초부터 중급까지", "java 참 쉬워요~", "ajax 기초부터", "자바의 원리", "자바 그까이꺼",
		"자기소개서 작성", "자우징자우징", "jsp 패턴"};

request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");

String str = "";
for (int i = 0; i < keywords.length; i++) {
	if (keywords[i].startsWith(keyword)) {
		if (i != 0 && !str.equals("")) {
			str += ",";
		}
		str += keywords[i];
	}
}
%>
<%= str %>