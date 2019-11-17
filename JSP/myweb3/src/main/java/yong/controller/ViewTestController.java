package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewTestController {
	// 리턴 타입 ModelAndView - 뷰 정보와 모델 정보를 담고있는 객체 반환
	@RequestMapping("/viewTest1.do")
	public ModelAndView viewTest1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/viewOk");
		return mav;
	}
	
	// 리턴 타입 String - 뷰 이름을 직접 리턴
	@RequestMapping("/viewTest2.do")
	public String viewTest2() {
		return "view/viewOk";
	}
	
	// 리턴 타입 void - 묵시적 View 지정 방법
	// ServletResponse나 HttpServletResponse 타입의 파라미터를 갖는 경우 메서드가 직접 응답 처리 가정
	// 파라미터가 없는 경우 요청 URL로 부터 결정된 뷰를 보여준다 -> 명령어를 주소로 지정
	@RequestMapping("/view/viewOk.do")
	public void viewTest3() {
		
	}
	
	// redirect: 맵핑한 멍령어를 호출하면 설정한 다른 명령어로 재호출
	@RequestMapping("viewTest3.do")
	public ModelAndView viewTest4() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/hello.do");
		return mav;
	}
}
