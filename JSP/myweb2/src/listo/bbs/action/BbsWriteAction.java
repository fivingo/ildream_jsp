package listo.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.bbs.model.BbsDAO;
import listo.bbs.model.BbsDTO;
import listo.controller.commandHandler;

public class BbsWriteAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bwriter = req.getParameter("bwriter");
		String bpwd = req.getParameter("bpwd");
		String bsubject = req.getParameter("bsubject");
		String bcontent = req.getParameter("bcontent");
		
		if (bsubject != null) {
			BbsDTO dto = new BbsDTO(bwriter, bpwd, bsubject, bcontent);
			BbsDAO dao = new BbsDAO();
			int count = dao.bbsWrite(dto);
			String msg = count > 0 ? "글쓰기 성공!" : "글쓰기 실패;;";
			req.setAttribute("msg", msg);
			return "/bbs/bbsMsg.jsp";
		} else {
			return "/bbs/bbsWrite.jsp";
		}
	}
}
