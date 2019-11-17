package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ParamTestController {
	@RequestMapping("/paramTest.do")
	public ModelAndView paramTest(@RequestParam(value="str", required=false) String str, 
			@RequestParam(value="idx", defaultValue="1") int idx) {
		System.out.println("str: " + str);
		System.out.println("idx: " + idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("param/paramOk");
		return mav;
	}
}
