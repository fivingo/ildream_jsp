package listo.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;
import listo.member.model.MemberDAO;

public class IdCheckAction implements commandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String userid = req.getParameter("userid");
		if (userid == null) {
			return "/member/idCheck.jsp";
		} else {
			MemberDAO dao = new MemberDAO();
			boolean result = dao.idCheck(userid);
			String msg = null;
			if (result) {
				msg = "아이디 사용 불가 (MVC)";
			} else {
				msg = "아이디 사용 가능 (MVC)";
				req.setAttribute("userid", userid);
			}
			req.setAttribute("msg", msg);
			return "/member/memberMsg_popup.jsp";
		}
	}
}
