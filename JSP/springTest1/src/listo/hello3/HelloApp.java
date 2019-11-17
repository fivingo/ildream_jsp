package listo.hello3;
// 기능 실행 부분[3]
// 스프링을 이용하여 의존성 많이 줄임: 외부설정파일 이용
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class HelloApp {
	public static void main(String[] args) {
		// 설정파일 경로 가져오기
		Resource resource = new ClassPathResource("applicationContext.xml");
		// 설정파일로부터 객체(Bean) 생성 (+ 설정, 관리)
		BeanFactory factory = new XmlBeanFactory(resource);
		// 생성한 객체(Bean) 형변환(Object->Type) 후 가져오기
		MessageBean bean = (MessageBean) factory.getBean("messageBean");
		// 객체의 기능 실행
		bean.sayHello("spring");
	}
}
