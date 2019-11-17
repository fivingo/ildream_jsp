package listo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listo.controller.commandHandler;

public class WriteAction implements commandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 1. 명령어와 관련된 비즈니스 로직 처리
		String result = "커맨드 패턴을 적용한 글쓰기 기능";
		// 2. 뷰 페이지에서 사용할 정보 저장
		req.setAttribute("result", result);
		// 3. 뷰 페이지의 URI 리턴
		return "/write.jsp";
	}
}
