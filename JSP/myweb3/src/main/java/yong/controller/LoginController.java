package yong.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yong.member.model.MemberDAO;

@Controller
public class LoginController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView login(
			@CookieValue(value="idMemory", defaultValue="noid") String idMemory,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (!idMemory.equals("noid")) {	// 아이디 기억 체크
			mav.addObject("idMemory", idMemory);
			mav.addObject("idMemory_cb", "checked");
		}
		mav.setViewName("member/login");
		return mav;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(
			@RequestParam("userId") String userId,
			@RequestParam("userPwd") String userPwd,
			@RequestParam(value="idMemory", required=false) String idMemory,
			HttpSession session, HttpServletResponse res) { 
		ModelAndView mav = new ModelAndView();
		int result = dao.loginCheck(userId, userPwd);
		if (result > 0) {	// 아이디, 비밀번호 일치시 로그인
			session.setAttribute("loginId", userId);	// 세션 생성
			if (idMemory != null) {	// 아이디 기억 체크시 쿠키 생성
				Cookie ck = new Cookie("idMemory", userId);
				ck.setMaxAge(60 * 60 * 24 * 7);
				res.addCookie(ck);
			} else {	// 미체크시 쿠키 죽이기
				Cookie ck = new Cookie("idMemory", userId);
				ck.setMaxAge(0);
				res.addCookie(ck);
			}
			mav.addObject("loginId", userId);
			mav.setViewName("member/loginOk");
		} else {
			mav.setViewName("member/login");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/logoutOk");
		return mav;
	}
}
