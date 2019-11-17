<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest</title>
<link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
<style>
h2 {
	text-align: center;
}
fieldset {
	width: 450px;
	margin: 0px auto;
}
fieldset li {
	list-style-type: none;
}
label {
	width: 80px;	/* width - 블록태그만 적용됨*/
	float: Left;
}
fieldset p {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<article>
<!-- 처리페이지 명명규칙 - 폼페이지_ok or 폼페이지_proc -->
<form name="paramTest" action="paramTest_ok.jsp">
<h2>파라미터 테스트</h2>
<fieldset>
<legend>값 입력</legend>
<ul>
<li><label>이름</label><input type="text" name="name"></li>
<li><label>비밀번호</label><input type="password" name="pwd"></li>
<li><label>성별</label><input type="radio" name="se" value="남자">남자
<input type="radio" name="se" value="여자">여자
<input type="radio" name="se" value="트랜스">트랜스</li>
<li><label>취미</label>
<input type="checkbox" name="cb" value="공부">공부
<input type="checkbox" name="cb" value="독서">독서
<input type="checkbox" name="cb" value="운동">운동
<input type="checkbox" name="cb" value="게임">게임
<input type="checkbox" name="cb" value="노래">노래</li>
</ul>
<p>
<input type="submit" value="확인">
</p>
</fieldset>
</form>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>