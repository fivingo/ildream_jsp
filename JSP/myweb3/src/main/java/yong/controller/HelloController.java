package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller	// 컨트롤러 지정
public class HelloController {
	@RequestMapping("/hello.do")	// 요청 경로(명령어) 지정
	public ModelAndView hello() {
		String result = "Spring MVC Framework!!";
		ModelAndView mav = new ModelAndView();	// MAV 객체 생성
		mav.addObject("result", result);	// 뷰로 보낼 데이터 (key, value)
		mav.setViewName("hello");	// 뷰 이름 지정
		return mav;
	}
}
