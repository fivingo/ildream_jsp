package listo.emp.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.emp.*;
import listo.emp.model.EmpDAO;
import listo.emp.model.EmpDTO;
import listo.controller.commandHandler;

public class EmpAllListAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		EmpDAO dao = new EmpDAO();
		ArrayList<EmpDTO> arr = dao.empAllList();
		req.setAttribute("edtos", arr);
		return "/emp/empList.jsp";
	}
}
