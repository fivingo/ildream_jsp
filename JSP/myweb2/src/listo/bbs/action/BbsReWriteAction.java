package listo.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.bbs.model.BbsDAO;
import listo.bbs.model.BbsDTO;
import listo.controller.commandHandler;

public class BbsReWriteAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bwriter = req.getParameter("bwriter");
		String bpwd = req.getParameter("bpwd");
		String bcontent = req.getParameter("bcontent");
		
		String bsubject = req.getParameter("bsubject");
		String breference_s = req.getParameter("breference");
		int breference = Integer.parseInt(breference_s);
		String blevel_s = req.getParameter("blevel");
		int blevel = Integer.parseInt(blevel_s);
		String brank_s = req.getParameter("brank");
		int brank = Integer.parseInt(brank_s);
		
		if (bwriter == null) {
			BbsDTO dto = new BbsDTO(bsubject, breference, blevel, brank);
			req.setAttribute("dto", dto);
			return "bbs/bbsReWrite.jsp";
		} else {
			BbsDAO dao = new BbsDAO();
			BbsDTO dto = new BbsDTO(0, bwriter, bpwd, bsubject, bcontent, null, 0, breference, blevel, brank, 0);
			int result = dao.bbsReWrite(dto);
			String msg = result > 0 ? "답변글작성 성공" : "답변글작성 실패패";
			req.setAttribute("msg", msg);
			return "bbs/bbsMsg.jsp";
		}
		
	}
}
