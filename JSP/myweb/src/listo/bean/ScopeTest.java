package listo.bean;

public class ScopeTest {
	private int count;
	
	public ScopeTest() {
		System.out.println("ScopeTest() 생성자 호출");
		count = 0;
	}

	public int getCount() {
		System.out.println("count의 값: " + this.count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count + "값이 누적되어 " + this.count + "을 가짐");
	}
}
