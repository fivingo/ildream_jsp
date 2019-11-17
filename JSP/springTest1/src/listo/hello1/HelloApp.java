package listo.hello1;
// 기능 실행 부분[1]
// 직접적인 선언에 의한 의존성 결합: 기능을 수정할때마다 객체의 코드자체를 수정하거나 또 다른 객체를 추가해야함
public class HelloApp {
	public static void main(String[] args) {
		System.out.println("프로그램의 시작");
		
		MessageBean bean = new MessageBean();
		bean.sayHello("스프링");
		
		System.out.println("프로그램의 끝");
	}
}
