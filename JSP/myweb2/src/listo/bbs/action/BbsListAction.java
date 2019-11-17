package listo.bbs.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.bbs.model.*;
import listo.controller.commandHandler;

public class BbsListAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BbsDAO dao = new BbsDAO();
		int totalCount = dao.getTotalCount();
		String cPage_s = req.getParameter("cPage");
		if (cPage_s == null || cPage_s.equals("")) {
			cPage_s = "1";
		}
		int cPage = Integer.parseInt(cPage_s);
		int listSize = 5;
		int pageBlockSize = 5;
		ArrayList<BbsDTO> arr = dao.bbsList(cPage, listSize);
		String pageStr = listo.paging.pagingModule.makePage("bbsList.listo", totalCount, listSize, pageBlockSize, cPage);
		req.setAttribute("arr", arr);
		req.setAttribute("lists", pageStr);
		return "/bbs/bbsList.jsp";
	}
}
