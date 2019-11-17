<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<!-- COS: 파일 업로드 등 지원 라이브러리 패키지-->
<!-- COS 사용시 method와 enctype은 정해짐 -->
<form name="fileUpload" method="post" enctype="multipart/form-data" action="fileUpload_ok.jsp">
<fieldset>
<legend>파일 업로드</legend>
<table>
<tr>
<th>파일: </th>
<td><input type="file" name="upload"></td>
<td><input type="submit" value="올리기"></td>
</tr>
</table>
</fieldset>
</form>
</body>
</html>