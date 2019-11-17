package yong.hello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp {
	public static void main(String[] args) {
		// 설정파일'들' 경로 가져오기
		String[] configLoc = {"applicationContext.xml"};
		// 설정파일로부터 객체(Bean) 생성 (+ 설정, 관리) - BeanFactory 상위호환
		ApplicationContext factory = new ClassPathXmlApplicationContext(configLoc);
		// 생성한 객체(Bean) 형변환(Object -> Type) 후 가져오기
		MessageBean bean = (MessageBean) factory.getBean("messageBean");
		// 객체의 기능 실행
		bean.sayHello();
	}
}
