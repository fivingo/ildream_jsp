package listo.guest.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.guest.model.GuestDAO;

public class GuestWriteAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String gwriter = req.getParameter("gwriter");
		String gcontent = req.getParameter("gcontent");
		GuestDAO dao = new GuestDAO();
		int result = dao.guestWrite(gwriter, gcontent);
		String msg = result > 0 ? "방명록 등록 성공" : "등록 실패";
		req.setAttribute("msg", msg);
		return "/guestbook/guestMsg.jsp";
	}
}
