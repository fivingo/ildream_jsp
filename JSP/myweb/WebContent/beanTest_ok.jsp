<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest_ok</title>
</head>
<body>
<h1>beanTest_ok.jsp</h1>
<jsp:useBean id="btest" class="listo.bean.BeanTest"/>

<!-- getParameter로 데이터를 받아오고 bean에 저장하고 출력 -->
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
%>
<jsp:setProperty property="name" name="btest" value="<%= name %>"/>
<jsp:setProperty property="age" name="btest" value="<%= age %>"/>
<jsp:setProperty property="addr" name="btest" value="<%= addr %>"/>
<jsp:setProperty property="phone" name="btest" value="<%= phone %>"/>
<h3>이름: <jsp:getProperty property="name" name="btest"/></h3>
<h3>나이: <jsp:getProperty property="age" name="btest"/></h3>
<h3>주소: <jsp:getProperty property="addr" name="btest"/></h3>
<h3>번호: <jsp:getProperty property="phone" name="btest"/></h3>

<!-- form태그의 name과 bean의 property가 같으면 세팅시 value 생략가능 -->
<jsp:setProperty property="name" name="btest"/>
<jsp:setProperty property="age" name="btest"/>
<jsp:setProperty property="addr" name="btest"/>
<jsp:setProperty property="phone" name="btest"/>
<h3>이름: <jsp:getProperty property="name" name="btest"/></h3>
<h3>나이: <jsp:getProperty property="age" name="btest"/></h3>
<h3>주소: <jsp:getProperty property="addr" name="btest"/></h3>
<h3>번호: <jsp:getProperty property="phone" name="btest"/></h3>

<!-- setProperty property에 모든 데이터 한번에 세팅 가능-->
<jsp:setProperty property="*" name="btest"/>
<h3>이름: <jsp:getProperty property="name" name="btest"/></h3>
<h3>나이: <jsp:getProperty property="age" name="btest"/></h3>
<h3>주소: <jsp:getProperty property="addr" name="btest"/></h3>
<h3>번호: <jsp:getProperty property="phone" name="btest"/></h3>

<!-- getProperty보단 표현식 사용이 편리함 -->
<jsp:setProperty property="*" name="btest"/>
<h3>이름: <%= btest.getName() %></h3>
<h3>나이: <%= btest.getAge() %></h3>
<h3>주소: <%= btest.getAddr() %></h3>
<h3>번호: <%= btest.getPhone() %></h3>
</body>
</html>
