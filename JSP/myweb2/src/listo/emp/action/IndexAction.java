package listo.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;

public class IndexAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		return "/indexMain.jsp";
	}
}
