<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리 프로그램 (Beans)</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
<style>
h2 {
	text-align: center;
}
fieldset {
	width: 400px;
	margin: 0px auto;
}
table {
	width: 350px;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<h2>사원 관리 프로그램 (Beans 적용)</h2>

<!-- 사원 등록 -->
<article>
<form name="empAdd2" action="emp2Add_ok.jsp">
<fieldset>
<legend>사원 등록</legend>
<table>
<tr>
	<th>사원이름</th>
	<td><input type="text" name="ename"></td>
</tr>
<tr>
	<th>E-mail</th>
	<td><input type="text" name="eemail"></td>
</tr>
<tr>
	<th>부서명</th>
	<td><input type="text" name="edept"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="사원등록">
	<input type="reset" value="다시작성"></td>
</tr>
</table>
</fieldset>
</form>
</article>

<!-- 사원 이름 검색 후 삭제 -->
<article>
<fieldset>
<legend>사원 삭제</legend>
<form name="empDelete" action="emp2Delete_ok.jsp">
<table>
<tr>
<th>사원이름</th>
<td><input type="text" name="ename" required="required"></td>
<td><input type="submit" value="삭제"></td>
</tr>
</table>
</form>
</fieldset>
</article>

<!-- 모든 사원 정보 보기 -->
<article>
<fieldset>
<legend>모든 사원 내역 보기</legend>
<h4><a href="emp2List.jsp">모든 사원 내역</a></h4>
</fieldset>
</article>

<!-- 사원 이름으로 검색 -->
<article>
<fieldset>
<legend>사원 검색</legend>
<form name="empDelete" action="emp2Search_ok.jsp">
<table>
<tr>
<th>사원이름</th>
<td><input type="text" name="ename" required="required"></td>
<td><input type="submit" value="검색"></td>
</tr>
</table>
</form>
</fieldset>
</article>

<!-- 사원 번호 검색 후 수정 -->
<article>
<fieldset>
<legend>사원 수정</legend>
<form name="empUpdate" action="emp2Update.jsp">
<table>
<tr>
<th>사원번호</th>
	<td><input type="text" name="eidx"></td>
	<td><input type="submit" value="검색" required="required"></td>
</tr>
</table>
</form>
</fieldset>
</article>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>
