package listo.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.emp.model.EmpDAO;
import listo.emp.model.EmpDTO;

public class EmpAddAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String ename = req.getParameter("ename");
		String eemail = req.getParameter("eemail");
		String edept = req.getParameter("edept");
		EmpDTO dto = new EmpDTO(0, ename, eemail, edept);
		EmpDAO dao = new EmpDAO();
		int result = dao.empAdd(dto);
		String msg = result > 0 ? "사원등록성공 (MVC)" : "사원등록실패 (MVC)";
		req.setAttribute("msg", msg);
		return "/emp/empMsg.jsp";
	}
}
