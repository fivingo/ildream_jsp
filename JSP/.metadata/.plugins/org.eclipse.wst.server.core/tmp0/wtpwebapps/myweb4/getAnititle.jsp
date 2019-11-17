<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String country = request.getParameter("country");

String usa = "지미뉴트론,심슨,스폰지밥,파워퍼프걸";
String jap = "다간,드래곤볼,슬램덩크";
String kor = "해모수,은비까비,배추도사 무도사";

if (country.equals("usa")) {
	out.print(usa);
} else if (country.equals("jap")) {
	out.print(jap);
} else if (country.equals("kor")) {
	out.print(kor);
}
%>