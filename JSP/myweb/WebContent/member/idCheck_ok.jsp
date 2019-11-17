<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="listo.member.MemberDAO"/>
<!DOCTYPE html>
<%
	String userid = request.getParameter("userid");

	boolean checkResult = mdao.idCheck(userid);
	if (checkResult) { // 중복o
%>
	<script>
		window.alert("중복된 아이디입니다.");
		location.href='idCheck.jsp';
	</script>
<%
	} else {	// 중복x
%>
	<script>
		window.alert('<%= userid %> 사용가능합니다.');
		// 부모창으로 데이터 전달
		opener.document.join.mid.value = '<%= userid %>';
		// 팝업창 알아서 종료
		window.self.close();
	</script>
<%
	}
%>
