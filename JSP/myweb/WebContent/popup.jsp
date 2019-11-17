<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<div style="border: 2px solid red; width: 210px; height: 240px">
<h2 style="text-align: center">공지사항</h2>
<h4>&nbsp;1. 지각하지 맙시다</h4>
<h4>&nbsp;2. 결석하지 맙시다</h4>
<h4>&nbsp;3. 복습 철저히 합시다 제발</h4>
<h4>&nbsp;4. 예습도 합시다 제발</h4>
</div>
<form name="popup">
<!-- checkBox 클릭시 쿠키 생성창으로 이동 -->
<input type="checkBox" name="cb" onclick="location.href='popup_ok.jsp'">24시간 안보기
</form>
</body>
</html>