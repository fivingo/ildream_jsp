<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>편의점 상품 발주 프로그램</h1>
<form name="order" action="order.do" method="post">
<h2>주문 상품 목록</h2>
[상품1] 상품명: <input type="text" name="itemdto[0].name"> / 
수량: <input type="text" name="itemdto[0].num"> / 
비고: <input type="text" name="itemdto[0].bigo"><br>
[상품2] 상품명: <input type="text" name="itemdto[1].name"> / 
수량: <input type="text" name="itemdto[1].num"> / 
비고: <input type="text" name="itemdto[1].bigo"><br>
[상품3] 상품명: <input type="text" name="itemdto[2].name"> / 
수량: <input type="text" name="itemdto[2].num"> / 
비고: <input type="text" name="itemdto[2].bigo"><br>
<hr>
지점명: <input type="text" name="marketdto.marketname"><br>
연락처: <input type="text" name="marketdto.markettel"><br>
주소: <input type="text" name="marketdto.marketaddr"><br>
<input type="submit" value="발주하기">
</form>
</body>
</html>