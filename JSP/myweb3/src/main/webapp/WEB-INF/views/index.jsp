<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openLogin() {	// 로그인 팝업창
	window.open('login.do', 'login', 'width=400, height=200, top=200, left=700');
}
</script>
</head>
<body>
<div>
<h3>${ msg }</h3>
</div>
<h1>index페이지입니다</h1>
<ul>
<li><a href="hello.do">스프링 MVC테스트</a></li>
<li><a href="memoWrite.do">메모작성하기</a></li>
<li><a href="memberJoin.do">회원가입</a>
<li><a href="order.do">편의점 발주 프로그램</a></li>
<li><a href="paramTest.do?str=spring&idx=3">파라미터 테스트</a></li>
<li><a href="cookieView.do">쿠키 데이터 확인하기</a></li>
<li><a href="cookieMake.do">쿠키 데이터 저장하기</a></li>
<li><a href="sessionView.do">세션 데이터 확인하기</a></li>
<li><a href="sessionMake.do">세션 데이터 저장하기</a></li>
<li><a href="viewTest1.do">명시적 View 지정 방법1</a></li>
<li><a href="viewTest2.do">명시적 View 지정 방법2</a></li>
<li><a href="view/viewOk.do">묵시적 View 지정 방법</a></li>
<li><a href="viewTest3.do">또 다른 명령어 호출</a></li>
<li><a href="modelTest1.do">모델 테스트1 (Map)</a></li>
<li><a href="modelTest2.do">모델 테스트2 (Model)</a></li>
<li><a href="modelTest3.do">모델 테스트3 (ModelMap)</a></li>
<li><a href="model/modelOk.do">모델 테스트4 (Map 반환)</a></li>
<li><a href="model/modelOk.do">모델 테스트5 (Model 반환)</a></li>
<li><a href="animeFindA.do">애니메이션 검색</a></li>
<li><a href="fileUploadForm.do">파일업로드</a></li>
<li><a href="fileList.do">파일 다운로드 리스트</a></li>
<li><a href="webFolder.do">웹폴더</a></li>
<li><a href="emp.do">사원 관리 프로그램</a></li>
</ul>
</body>
</html>