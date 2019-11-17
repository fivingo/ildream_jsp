package listo.emp.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.emp.model.EmpDAO;
import listo.emp.model.EmpDTO;

public class EmpUpdateAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String eidx_s = req.getParameter("eidx");
		int eidx = Integer.parseInt(eidx_s);
		String ename = req.getParameter("ename"); 
		String eemail = req.getParameter("eemail"); 
		String edept = req.getParameter("edept");
		if (ename == null && eemail == null && edept == null) {
			EmpDAO dao = new EmpDAO();
			ArrayList<EmpDTO> arr = dao.empUpdate(eidx);
			req.setAttribute("edto_u", arr);
			return "/emp/empUpdate.jsp";
		} else {
			EmpDAO dao = new EmpDAO();
			int result = dao.empUpdate_ok(eidx, ename, eemail, edept);
			String msg = result > 0 ? "사원 수정 완료 (MVC)" : "사원 수정 실패 (MVC)";
			req.setAttribute("msg", msg);
			return "/emp/empMsg.jsp";
		}
	}
}
