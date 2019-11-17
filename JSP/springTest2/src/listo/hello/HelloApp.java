package listo.hello;
// 기능 실행 부분
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
		bean.sayHello();
	}
}
