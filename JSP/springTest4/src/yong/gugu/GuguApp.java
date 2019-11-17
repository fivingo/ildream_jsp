package yong.gugu;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GuguApp {
	public static void main(String[] args) {
		// 설정파일'들' 경로 가져오기
		String[] configLoc = {"applicationContext.xml"};
		// 설정파일로부터 객체(Bean) 생성 (+ 설정, 관리) - BeanFactory 상위호환
		ApplicationContext factory = new ClassPathXmlApplicationContext(configLoc);
		// 생성한 객체(Bean) 형변환(Object -> Type) 후 가져오기
		GuguBean bean2 = (GuguBean) factory.getBean("guguBean2");
		// 객체의 기능 실행
		bean2.gugu();	// 2단
		
		// 생성한 객체(Bean) 형변환(Object -> Type) 후 가져오기
		GuguBean bean3 = (GuguBean) factory.getBean("guguBean3");
		// 객체의 기능 실행
		bean3.gugu();	// 3단
	}
}
