<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>발주 내역 확인</h1>
<h2>주문 목록</h2>
<ul>
<c:forEach var="item" items="${ orderDTO.itemdto }">
<li>이름: ${ item.name } / 수량: ${ item.num } / 비고: ${ item.bigo }</li>
</c:forEach>
</ul>
<h2>주문 매장 정보</h2>
<h3>매장명: ${ orderDTO.marketdto.marketname }</h3>
<h3>연락처: ${ orderDTO.marketdto.markettel }</h3>
<h3>주소: ${ orderDTO.marketdto.marketaddr }</h3>
</body>
</html>