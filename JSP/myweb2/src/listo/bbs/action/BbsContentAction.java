package listo.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.bbs.model.*;
import listo.controller.commandHandler;

public class BbsContentAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bidx_s = req.getParameter("bidx");
		if (bidx_s == null || bidx_s.equals("")) {
			bidx_s = "0";
		}
		int bidx = Integer.parseInt(bidx_s);

		BbsDAO dao = new BbsDAO();
		BbsDTO dto = null; 
		dto = dao.bbsContent(bidx);
		dao.readCount(bidx, dto.getBreadCount());
		
		String goPage = "/bbs/bbsContent.jsp";
		
		if (dto == null) {
			req.setAttribute("msg", "삭제된 게시글이거나 잘못된 접근입니다.");
			goPage = "/bbs/bbsMsg.jsp";
		} else {
			dto.setBcontent(dto.getBcontent().replaceAll("\n", "<br>"));
			req.setAttribute("dto_c", dto);
		}
		return goPage;
	}
}
