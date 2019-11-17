package yong.controller;

import java.io.*;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import yong.file.model.FileDTO;

@Controller
public class FileController {
	@RequestMapping("/fileUploadForm.do")
	public String fileUploadForm() {
		return "file/fileUploadForm";
	}

	// 매개변수 @requsetParam 사용
	@RequestMapping("/fileUpload1.do")
	public String fileUpload1(@RequestParam("writer") String writer,
			@RequestParam("upload") MultipartFile upload) {
		copyInto(writer, upload);
		return "file/fileUploadOk";
	}
	
	// @MultipartHttpServletRequest 사용
	@RequestMapping("/fileUpload2.do")
	public String fileUpload2(MultipartHttpServletRequest req) {
		String writer = req.getParameter("writer");
		MultipartFile upload = req.getFile("upload");
		copyInto(writer, upload);
		return "file/fileUploadOk";
	}

	// DTO 사용
	@RequestMapping("/fileUpload3.do")
	public String fileUpload3(FileDTO dto) {
		copyInto(dto.getWriter(), dto.getUpload());
		return "file/fileUploadOk";
	}

	// 다중 파일 업로드 - 같은 파라미터명 자동 컬렉션 추가
	@RequestMapping("/fileUpload4.do")
	public String fileUpload4(@RequestParam("writer") String writer,
			@RequestParam("upload") List<MultipartFile> upload) {
		for (int i = 0; i < upload.size(); i++) {
			copyInto(writer, upload.get(i));
		}
		return "file/fileUploadOk";
	}
	
	/** 파일 복사 관련 메서드 */
	public void copyInto(String writer, MultipartFile upload) {
		try {
			File outFile = new File("D:/Documents/Programming_DREAM/upload/"
							+ upload.getOriginalFilename());	// 경로명 + 파일명
			byte[] bytes = upload.getBytes();
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 파일 다운로드 목록 진입 메서드 */
	@RequestMapping("/fileList.do")
	public ModelAndView fileList() {
		File f = new File("D:/Documents/Programming_DREAM/upload/");
		File[] files = f.listFiles();
		ModelAndView mav = new ModelAndView();
		mav.addObject("files", files);
		mav.setViewName("file/fileList");
		return mav;
	}
	
	// 파일 다운로드
	@RequestMapping("/down.do")
	public ModelAndView fileDownload(@RequestParam("filename") String filename) {
		File f = new File("D:/Documents/Programming_DREAM/upload/" + filename);
		// (View view, String modelName, Object modelObject)
		ModelAndView mav = new ModelAndView("yongDown", "downloadFile", f);
		return mav;
	}
}
