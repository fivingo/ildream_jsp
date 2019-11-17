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
<h1>웹폴더</h1>
<form name="upload" action="webFolderUp.do" method="post" enctype="multipart/form-data">
<fieldset>
<legend>파일 업로드</legend>
사용자: <input type="text" name="writer">
파일: <input type="file" name="upload">
<input type="submit" value="업로드">
</fieldset>
</form>
<c:if test="${ empty files }">
<h4>파일이 없습니다.</h4>
</c:if>
<ul>
<c:if test="${ !empty upCrPath }">
	<c:url var="goParent" value="upCrPath.do">
		<c:param name="crPath">${ crPath }</c:param>
	</c:url>
	<a href="${ goParent }">-상위로-</a>
</c:if>
<c:forEach var="file" items="${ files }">
	<li>
	<c:if test="${ file.isFile() }">
		<c:url var="fileUrl" value="download.do">
			<c:param name="path">${ file.path }</c:param>
		</c:url>
		[FILE] <a href="${ fileUrl }">${ file.name }</a>
		<c:url var="fileUrl_del" value="delete.do">
			<c:param name="path">${ file.path }</c:param>
		</c:url>
		<a href="${ fileUrl_del }">삭제</a>
	</c:if>
	<c:if test="${ !file.isFile() }">
		<c:url var="folderUrl" value="webFolder.do">
			<c:param name="crPath">${ crPath }</c:param>
			<c:param name="folderName">${ file.name }</c:param>
		</c:url>
		[DIR] <a href="${ folderUrl }">${ file.name }</a>
		<c:url var="folderUrl_del" value="delete.do">
			<c:param name="path">${ file.path }</c:param>
		</c:url>
		<a href="${ folderUrl_del }">삭제</a>
	</c:if>
	
	</li>
</c:forEach>
</ul>
</body>
</html>