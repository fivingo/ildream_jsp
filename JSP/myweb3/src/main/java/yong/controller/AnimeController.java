package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnimeController {
	@ModelAttribute("keywords")	// 공통 모델 처리 메서드
	public String[] getKeywords() {
		String[] keywords = {"지구용사 다간", "쪽빛보다 푸르게", "뽀로로", "영혼기병 라젠카", "파워퍼프걸"};
		return keywords;
	}
	
	@ModelAttribute("category")	// 공통 모델 처리 메서드
	public String[] getCategory() {
		String[] category = {"한국", "일본", "미국"};
		return category;
	}
	
	@RequestMapping("/animeFindA.do")
	public String animeFindA(Model model) {
		//model.addAttribute("keywords", getKeywords());
		//model.addAttribute("category", getCategory());
		return "anime/animeA";
	}
	
	@RequestMapping("/animeFindB.do")
	public ModelAndView animeFindB() {
		ModelAndView mav = new ModelAndView();
		//mav.addObject("keywords", getKeywords());
		//mav.addObject("category", getCategory());
		mav.setViewName("anime/animeB");
		return mav;
	}
}
