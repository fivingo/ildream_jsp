package listo.hello2;
// 기능 실행 부분[2]
// 인터페이스를 이용하여 의존성 줄임: 1번경우보단 기능 수정 비교적 용이하지만 코드를 직접 수정한다.
public class HelloApp {
	public static void main(String[] args) {
		// 다형성을 이용하여 생성하는 객체를 변경해줘야한다 (코드 직접수정)
		MessageBean bean = new MessageBeanEn();
		bean.sayHello("스프링");
	}
}
