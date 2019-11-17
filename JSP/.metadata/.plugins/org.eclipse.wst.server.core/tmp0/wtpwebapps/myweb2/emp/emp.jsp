<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원관리 프로그램 (MVC)</h1>
<form name="empAdd" action="empAdd.listo">
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
	<input type="reset" value="다시작성">
	</td>
</tr>
</table>
</fieldset>
</form>
<hr>
<form name="empDel" action="empDelete.listo">
<fieldset>
<legend>사원 삭제</legend>
<table>
<tr>
	<th>사원번호</th>
	<td><input type="text" name="eidx"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="삭제">
	</td>
</tr>
</table>
</fieldset>
</form>
<hr>
<fieldset>
<legend>모든 사원 내역</legend>
<h3><a href="empAllList.listo">모든 사원 내역 보기</a></h3>
</fieldset>
<br>
<fieldset>
<legend>사원 검색</legend>
<form name="empSearch" action="empSearch.listo">
<table>
<tr>
<th>사원이름</th>
<td><input type="text" name="ename"></td>
<td><input type="submit" value="검색"></td>
</tr>
</table>
</form>
</fieldset>
<hr>
<fieldset>
<legend>사원 수정</legend>
<form name="empUpdate" action="empUpdate.listo">
<table>
<tr>
<th>사원번호</th>
	<td><input type="text" name="eidx"></td>
	<td><input type="submit" value="수정"></td>
</tr>
</table>
</form>
</fieldset>
</body>
</html>