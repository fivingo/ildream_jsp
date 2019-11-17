package listo.member.action;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.member.model.*;

public class MemberJoinAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int midx = 0;
		String mid = req.getParameter("mid");
		String mpwd = req.getParameter("mpwd");
		String mname = req.getParameter("mname");
		String memail = req.getParameter("memail");
		String maddr = req.getParameter("maddr");
		Date mjoinDate = null;
		MemberDTO dto = new MemberDTO(midx, mid, mpwd, mname, memail, maddr, mjoinDate);
		MemberDAO dao = new MemberDAO();
		
		int result = dao.memberJoin(dto);
		String msg = result > 0 ? "회원가입 완료 (MVC)" : "회원가입 실패 (MVC)";
		req.setAttribute("msg", msg);
		return "/member/memberMsg.jsp";
	}
}
