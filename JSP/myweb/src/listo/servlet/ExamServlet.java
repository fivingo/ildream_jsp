package listo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExamServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8"); 
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><head><title>시험 결과 조회</title>");
		pw.println("<script>function score() {");
		pw.println("var kor = parseInt(document.fm.kor.value);");
		pw.println("var eng = parseInt(document.fm.eng.value);");
		pw.println("var math = parseInt(document.fm.math.value);");
		pw.println("var total = kor + eng + math;");
		pw.println("var average = total / 3;");
		pw.println("var grade = '';");
		pw.println("var result = '';");
		pw.println("switch (parseInt(average / 10)) {");
		pw.println("case 10: case 9: grade = 'A'");
		pw.println("break;");
		pw.println("case 8: grade = 'B'");
		pw.println("break;");
		pw.println("case 7: grade = 'C'");
		pw.println("break;");
		pw.println("case 6: grade = 'D'");
		pw.println("break;");
		pw.println("default: grade = 'F' }");
		pw.println("if (kor < 40 || eng < 40 || math < 40) {");
		pw.println("result = '과락입니다.'");
		pw.println("} else if (average < 60) { result = '불합격입니다.'");
		pw.println("} else { result = '합격입니다.' }");
		pw.println("window.alert('시험결과' + '\\n총점: ' + total + '\\n평균: '");
		pw.println(" + average.toFixed(2) + '\\n등급: ' + grade + '\\n결과: ' + result);}");
		pw.println("</script></head>");
		pw.println("<body><h1>시험 결과 조회</h1><form name='fm'><table border='1px'>");
		pw.println("<tr><td colspan='2' align='center'>시험 결과 조회</td></tr>");
		pw.println("<tr><td>국어</td><td><input type='text' name='kor'></td>");
		pw.println("<tr><td>영어</td><td><input type='text' name='eng'></td>");
		pw.println("<tr><td>수학</td><td><input type='text' name='math'></td>");
		pw.println("<tr><td colspan='2' align='center'>");
		pw.println("<input type='button' value='조회' onclick='score()'>");
		pw.println("<input type='reset' value='다시작성'></td>");
		pw.println("</table></form></body></html>");
		
		pw.close();
	}
}