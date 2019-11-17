package listo.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.emp.model.EmpDAO;

public class EmpDeleteAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String eidx_s = req.getParameter("eidx");
		int eidx = Integer.parseInt(eidx_s);
		EmpDAO dao = new EmpDAO();
		int result = dao.empDel(eidx);
		String msg = result > 0 ? "사원삭제성공 (MVC)" : "사원삭제실패 (MVC)";
		req.setAttribute("msg", msg);
		return "/emp/empMsg.jsp";
	}
}
