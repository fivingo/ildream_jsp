package yong.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CookieController {
	// 쿠키 가져오기
	@RequestMapping("/cookieView.do")
	public ModelAndView cookieView(@CookieValue(value="saveid", defaultValue="noid") String saveid) {
		System.out.println("saveid: " + saveid);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cookie/cookieOk");
		return mav;
	}
	
	// 쿠기 생성하기
	@RequestMapping("/cookieMake.do")
	public ModelAndView cookieMake(HttpServletResponse res) {
		Cookie ck = new Cookie("saveid", "hong");
		ck.setMaxAge(60 * 60);
		res.addCookie(ck);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cookie/cookieOk");
		return mav;
	}
	
	// 세션 가져오기
	@RequestMapping("/sessionView.do")
	public ModelAndView sessionView(HttpSession session) {	// 세션 생성/확인 두가지 파라미터
		String sname = (String) session.getAttribute("sname");
		System.out.println("sname: " + sname);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cookie/cookieOk");
		return mav;
	}
	
	// 세션 생성하기
	@RequestMapping("/sessionMake.do")
	public ModelAndView sessionMake(HttpServletRequest req) {	// 세션 생성/확인 두가지 파라미터
		HttpSession session = req.getSession();
		session.setAttribute("sname", "hong");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cookie/cookieOk");
		return mav;
	}
}
