package yong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping("/index.do")
	public ModelAndView loginSessionCheck(HttpSession session) {
		Object loginId_obj = session.getAttribute("loginId");
		String msg = null;
		if (loginId_obj == null) {	// 세션 유무 체크
			msg = "<a href=\"javascript:openLogin()\">로그인</a>";
		} else {
			String loginId = (String) loginId_obj;
			msg = loginId + "님 ㅎㅇ" + " | <a href=\"logout.do\">로그아웃</a>";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("index");
		return mav;
	}
}
