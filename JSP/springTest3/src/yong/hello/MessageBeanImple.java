package yong.hello;
// AOP의 핵심 기능 로직
public class MessageBeanImple implements MessageBean {
	private String name;
	private String greeting;
	
	// 생성자 주입 방식
	public MessageBeanImple(String name) {
		super();
		this.name = name;
	}

	// setter 주입 방식
	public String getGreeting() {
		return greeting;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}

	// 핵심 로직
	@Override
	public void sayHello() {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		String msg = greeting + ", " + name;
		System.out.println(msg);
	}
}
