package listo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class GuguServlet extends HttpServlet{
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
		pw.println("<html><head><title>gugudan</title></head><body><table border='1px'>");
		
		for (int i = 2; i <= 9; i++) {
			pw.println("<tr>");
			for (int j = 1; j <= 9; j++) {
				pw.println("<td>" + i + " * " + j + " = " + (i * j) + "</td>");
			}
			pw.println("</tr>");
		}
		
		pw.println("</table></body></html>");

		pw.close();
	}
}
