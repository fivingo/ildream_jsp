package yong.controller;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebFolderController {
	public static final String BASE_PATH = "D:/Documents/Programming_DREAM/upload/";
	
	// 파일 목록
	@RequestMapping("/webFolder.do")
	public ModelAndView fileList(
			@RequestParam(value = "crPath", defaultValue = BASE_PATH) String crPath,
			@RequestParam(value = "folderName", defaultValue = "") String folderName) {
		String path = crPath + folderName;	// 기존 경로에 폴더명을 추가한 새 경로
		File f = new File(path);
		File[] files = f.listFiles();
		
		ModelAndView mav = new ModelAndView();
		if (!path.equals(BASE_PATH)) {
			mav.addObject("upCrPath", folderName);
		}
		mav.addObject("crPath", path);
		mav.addObject("files", files);
		mav.setViewName("webFolder/webFolder");
		return mav;
	}
	
	// 상위폴더로
	@RequestMapping("/upCrPath.do")
	public ModelAndView upCrPath(@RequestParam("crPath") String crPath) {
		// 마지막 "/" 기준으로 경로 문자열 자르기
		int endIndex = crPath.lastIndexOf("/");
		String upCrPath = crPath.substring(0, endIndex + 1);
		File f = new File(upCrPath);
		File[] files = f.listFiles();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("crPath", upCrPath);
		mav.addObject("files", files);
		mav.setViewName("webFolder/webFolder");
		return mav;
	}
	
	// 파일 업로드
	@RequestMapping("/webFolderUp.do")
	public String fileUpload(MultipartHttpServletRequest req) {
		String writer = req.getParameter("writer");
		MultipartFile upload = req.getFile("upload");
		copyInto(writer, upload);
		return "webFolder/webFolderUpOk";
	}
	
	/** 파일 복사 관련 메서드 */
	public void copyInto(String writer, MultipartFile upload) {
		try {
			File f = new File(BASE_PATH + writer);
			if (!f.exists()) {
				f.mkdir();
			}
			File outFile = new File(BASE_PATH + writer + "/" + upload.getOriginalFilename());
			byte[] bytes = upload.getBytes();
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 파일 다운로드
	@RequestMapping("/download.do")
	public ModelAndView fileDownload(@RequestParam("path") String path) {
		File f = new File(path);
		ModelAndView mav = new ModelAndView("yongDown", "downloadFile", f);
		return mav;
	}
	
	/** 폴더 삭제 관련 메서드 */
	public void deleteFolder(File f) {
		File[] files = f.listFiles();
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {	// 폴더면 삭제 시도하고 실패시 재귀호출
				boolean result = files[i].delete();
				if (!result) {
					deleteFolder(files[i]);
				}
			} else { // 파일이면 바로 삭제
				files[i].delete();
			}
		}
		f.delete();	// 경로의 최상위 폴더 삭제
	}
	
	// 파일/폴더 삭제
	@RequestMapping("delete.do")
	public ModelAndView delete(@RequestParam("path") String path) {
		File f_del = new File(path);
		if (f_del.isFile()) {	// 파일이면 바로 삭제
			f_del.delete();
		} else {	// 폴더면 폴더 삭제 메서드 호출
			deleteFolder(f_del);
		}
		
		// 삭제 후 경로 재지정
		String upCrPath = BASE_PATH;
		int endIndex = path.lastIndexOf("\\");
		upCrPath = path.substring(0, endIndex);
		File f = new File(upCrPath);
		File[] files = f.listFiles();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("crPath", upCrPath);
		mav.addObject("files", files);
		mav.setViewName("webFolder/webFolder");
		return mav;
	}
}
