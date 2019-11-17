package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yong.order.model.OrderDTO;

@Controller
public class OrderController {
	@RequestMapping(value="/order.do", method=RequestMethod.GET)
	public ModelAndView orderForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderForm");
		return mav;
	}
	
	@RequestMapping(value="/order.do", method=RequestMethod.POST)
	public ModelAndView orderSubmit(OrderDTO dto) {
		// 자동으로 프로퍼티값 저장 (name-property 같게)
		// 커맨드 객체(파라미터 타입) - View 자동으로 데이터 전달
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderOk");
		return mav;
	}
}
