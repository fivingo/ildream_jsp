package yong.gugu;

public class GuguBeanImple2 implements GuguBean {
	private int number = 2;
	
	// 핵심 로직
	@Override
	public void gugu() {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		for (int i = 1; i <= 9; i++) {
			System.out.println(number + " * " + i + " = " + (number * i));
		}
	}
}
