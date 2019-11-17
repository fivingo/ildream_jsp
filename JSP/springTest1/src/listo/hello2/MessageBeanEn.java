package listo.hello2;
// 객체2
public class MessageBeanEn implements MessageBean {
	@Override
	public void sayHello(String name) {
		System.out.println("Hello, " + name);
	}
}
