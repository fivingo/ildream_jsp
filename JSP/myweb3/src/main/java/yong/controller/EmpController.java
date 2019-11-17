package yong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yong.emp.model.EmpDAO;
import yong.emp.model.EmpDTO;

@Controller
public class EmpController {
	@Autowired
	private EmpDAO empDao;
	
	@RequestMapping("/emp.do")
	public  String empIndex() {
		return "emp/emp";
	}
	
	@RequestMapping("/empAdd.do")
	public ModelAndView empAdd(EmpDTO dto) {
		int result = empDao.empAdd(dto);
		String msg = result > 0 ? "사원등록성공" : "사원등록실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
	
	@RequestMapping("/empDel.do")
	public ModelAndView empDel(@RequestParam("ename") String ename) {
		int result = empDao.empDel(ename);
		String msg = result > 0 ? "사원삭제성공" : "사원삭제실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
	
	@RequestMapping("/empList.do")
	public ModelAndView empList() {
		List lists = empDao.empList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("emp/empList");
		return mav;
	}
	
	@RequestMapping("/empSearch.do")
	public ModelAndView empSearch(@RequestParam("ename") String ename) {
		List lists = empDao.empSearch(ename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("emp/empSearch");
		return mav;
	}
	
	@RequestMapping("/empUpdate.do")
	public ModelAndView empUpdate(@RequestParam("eidx") int eidx) {
		List lists = empDao.empUpdate(eidx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("emp/empUpdate");
		return mav;
	}
	
	@RequestMapping("/empUpdate_ok.do")
	public ModelAndView empUpdate_ok(EmpDTO dto) {
		int result = empDao.empUpdate_ok(dto);
		String msg = result > 0 ? "정보수정성공" : "정보수정실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
}
