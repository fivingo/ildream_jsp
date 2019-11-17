package yong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yong.memo.model.MemoDAO;
import yong.memo.model.MemoDTO;

@Controller	// 해당 클래스가 컨트롤러임을 명시
@RequestMapping("/memoWrite.do")	// 처리할 요청 경로 지정
public class MemoController {
	@Autowired	// 의존 자동 주입(xml-config): 따로 빈 객체를 만들어 의존성 주입(DI)하는 대신 자동으로 주입 
	private MemoDAO memoDao;
	
	// 전송방식을 통해 같은 경로(명령어)로 두가지 처리 가능
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView memoWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memo/memoWriteForm");
		return mav;
	}
	
	// 전송방식을 통해 같은 경로(명령어)로 두가지 처리 가능
	@RequestMapping(method=RequestMethod.POST)
	/* 
	 * form 요소의 name과 도메인오브젝트(DTO)의 property가 같으면 자동으로 파라미터값이 저장됨
	 * 도메인오브젝트는 mav.addObject() 메서드 사용안해도 대상 View(jsp)로 자동으로 데이터 전달
	 * View로 전달된 도메인오브젝트는 View에서 클래스명을 변수명처럼? 변환후  사용 가능 (첫글자 소문자로)
	 * @ModelAttribute(s): 파라미터의 클래스명을 지정한 문자열로 별칭 설정
	 */
	public ModelAndView memoWrite(@ModelAttribute("dto") MemoDTO dto) {
		int result = memoDao.memoWrite(dto);
		System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memo/memoOk");
		return mav;
	}
}
