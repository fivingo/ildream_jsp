<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 가입 성공</h2>
<h3>아이디: ${ memberDTO.mid }</h3>
<h3>비밀번호:  ${ memberDTO.mpwd }</h3>
<h3>이름:  ${ memberDTO.mname }</h3>
<h3>e-mail:  ${ memberDTO.memail }</h3>
<h3>주소:  ${ memberDTO.maddr }</h3>
</body>
</html>