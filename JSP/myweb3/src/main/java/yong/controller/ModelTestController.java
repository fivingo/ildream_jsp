package yong.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModelTestController {
	// Map<k, v> Collection 객체 매개변수
	@RequestMapping("/modelTest1.do")
	public String modelTest1(Map<String, String> model) {
		// Map 객체의 데이터 저장
		model.put("result", "Map객체를 매개변수로 활용한 데이터 넘기기");
		return "model/modelOk";
	}
	
	// Model 매개변수
	@RequestMapping("/modelTest2.do")
	public String modelTest2(Model model) {
		// Model의 데이터 저장
		model.addAttribute("result", "Model 매개변수를 활용한 데이터 넘기기");
		return "model/modelOk";
	}
	
	// ModelMap 객체 매개변수
	@RequestMapping("/modelTest3.do")
	public String modelTest3(ModelMap model) {
		// ModelMap의 데이터 저장
		model.addAttribute("result", "ModelMap 매개변수를 활용한 데이터 넘기기");
		return "model/modelOk";
	}
	
//	// Map<k, v> 객체 반환
//	@RequestMapping("/model/modelOk.do")
//	public Map<String, String> modelTest4() {
//		// Map 객체 생성
//		Map<String, String> model = new HashMap<String, String>();
//		// Map 객체의 데이터 저장
//		model.put("result", "Map객체를 반환하여 데이터 넘기기");
//		return model;
//	}
	
	// ModelMap 반환
	@RequestMapping("/model/modelOk.do")
	public Model modelTest5() {
		// ModelMap 객체 생성 (Model 상속)
		Model model = new ExtendedModelMap();
		// Model의 데이터 저장
		model.addAttribute("result", "ModelMap을 반환한 데이터 넘기기");
		return model;
	}
}
