package yong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yong.member.model.MemberDAO;
import yong.member.model.MemberDTO;

@Controller	// 해당 클래스가 컨트롤러임을 명시
public class MemberController {
	@Autowired	// 의존 자동 주입(xml-config)
	private MemberDAO memberDao;
	
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public ModelAndView  memberJoinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoin");
		return mav;
	}
	
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO dto) {
		int count = memberDao.memberJoin(dto);
		ModelAndView mav = new ModelAndView();
		if (count > 0) {
			mav.setViewName("member/memberJoinOk");
		} else {	// 가입실패 (임시)
			mav.setViewName("member/memberJoin");
		}
		return mav;
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheckForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/idCheck");
		return mav;
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public ModelAndView idCheck(String userid) {
		ModelAndView mav = new ModelAndView();
		boolean result = memberDao.idCheck(userid);
		if (!result) {
			mav.addObject("userid", userid);	// View로 보낼 아이디
			mav.setViewName("member/idCheckOk");
		} else {
			mav.setViewName("member/idCheck");
		}
		return mav;
	}
}
