package listo.hello;
// 의존성 주입 (의존성 해결): DI (Dependency Injection)
public class MessageBeanImple implements MessageBean {
	private String greeting;	// 인사말
	private String name;		// 이름
	private MsgOutput output;	// 외부출력
	
	// 생성자 주입 방식 (Constructor Injection)
	public MessageBeanImple(String name) {
		super();
		this.name = name;
	}
	
	// 세터 주입 방식 (Setter Injection)
	public String getGreeting() {
		return greeting;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	public MsgOutput getOutput() {
		return output;
	}
	public void setOutput(MsgOutput output) {
		this.output = output;
	}

	@Override
	public void sayHello() {
		String msg = greeting + ", " + name + "!!";
		System.out.println(msg);
		try {
			output.output(msg);
		} catch (Exception e) {}
	}
}
