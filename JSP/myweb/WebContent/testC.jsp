<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>스크립팅 원소 테스트</h1>
<!-- 이것은 HTML 주석 -->

<!-- 스크립팅 원소 (Scripting Element) -->
<%	// 스크립트릿(scriptlet):
	// JSP페이지가 servlet으로 변환되고 요청될때 코드가 service() 메서드의 영역에서 선언
	// 이곳은 자바코드를 작성할 수 있는 영역  /* 여러줄 주석 */ /** 문서화 주석 */
	System.out.println("jsp에서 작성한 문자열");
	// out: jsp의 기본객체 (출력스트림)
	out.println("<h3>jsp에서 작성한 문자열<h3>");
	String str = "java"; // 지역변수
	out.println("<h3>str = " + str + "</h3>");
%>
<h3>str =<%=str%></h3>
<%!	// 선언부(declaration) - 클래스 내부에 선언 (service() 메서드 밖에)
	String str = "jsp"; // 멤버변수
	// 클래스 내부에 선언되므로 메서드도 선언가능
	public int getMaxNum(int num1, int num2) {
		int max = num1 > num2 ? num1 : num2;
		return max;
	}
%>
<%	// scriptlet
	out.println("5와 7중에 큰수: " + getMaxNum(5, 7));
%>
<h3>8과 4중 큰수: <%=getMaxNum(8, 4)%></h3>
<%	// scriptlet
	out.println("<h3>str = " + str + "</h3>");
	out.println("<h3>str = " + this.str + "</h3>");
	
	Calendar now = Calendar.getInstance();
	int y = now.get(Calendar.YEAR);
	int m = now.get(Calendar.MONTH) + 1; 
	int d = now.get(Calendar.DATE);
	
	out.println("<h3>" + y + "년 " + m + "월 " + d + "일");
%>
</body>
</html>
