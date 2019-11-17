package listo.guest.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.guest.model.*;

public class GuestListAction implements commandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		int totalCount = dao.getTotalCount();
		String cPage_s = req.getParameter("cPage");
		if (cPage_s == null || cPage_s.equals("")) {
			cPage_s = "1";
		}
		int cPage = Integer.parseInt(cPage_s);
		int listSize = 3;
		int pageBlockSize = 3;
		Vector<GuestDTO> v = dao.guestList(cPage, listSize);
		req.setAttribute("lists", v);
		return "/guestbook/guestList.jsp";
	}
}
