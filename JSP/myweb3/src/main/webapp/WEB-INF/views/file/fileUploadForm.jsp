<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>파일 업로드 테스트</h1>
<form name="fileUpload1" action="fileUpload1.do" method="post" enctype="multipart/form-data">
	<fieldset>
	<legend>파일 올리기1</legend>
	<h3>@requsetParam 사용</h3>
	작성자: <input type="text" name="writer"><br>
	올릴 파일: <input type="file" name="upload"><br>
	<input type="submit" value="파일올리기">
	</fieldset>
</form>
<hr>
<form name="fileUpload2" action="fileUpload2.do" method="post" enctype="multipart/form-data">
	<fieldset>
	<legend>파일 올리기2</legend>
	<h3>@MultipartHttpServletRequest 사용</h3>
	작성자: <input type="text" name="writer"><br>
	올릴 파일: <input type="file" name="upload"><br>
	<input type="submit" value="파일올리기">
	</fieldset>
</form>
<hr>
<form name="fileUpload3" action="fileUpload3.do" method="post" enctype="multipart/form-data">
	<fieldset>
	<legend>파일 올리기3</legend>
	<h3>DTO 사용</h3>
	작성자: <input type="text" name="writer"><br>
	올릴 파일: <input type="file" name="upload"><br>
	<input type="submit" value="파일올리기">
	</fieldset>
</form>
<hr>
<form name="fileUpload4" action="fileUpload4.do" method="post" enctype="multipart/form-data">
	<fieldset>
	<legend>파일 업로드4</legend>
	<h3>다중 파일 올리기</h3>
	작성자: <input type="text" name="writer"><br>
	올릴 파일1: <input type="file" name="upload"><br>
	올릴 파일2: <input type="file" name="upload"><br>
	올릴 파일3: <input type="file" name="upload"><br>
	<input type="submit" value="파일올리기">
	</fieldset>
</form>
</body>
</html>