package listo.emp.action;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.emp.model.*;

public class EmpSearchAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String ename = req.getParameter("ename");
		EmpDAO dao = new EmpDAO();
		ArrayList<EmpDTO> arr = dao.empSearch(ename);
		req.setAttribute("edto_s", arr);
		return "/emp/empSearch.jsp";
	}
}
