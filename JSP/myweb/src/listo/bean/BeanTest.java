package listo.bean;

public class BeanTest {	// DTO (=VO): 데이터 전송 객체 (Data transfer object)
	// 테이블의 컬럼명, 컬럼개수와 일치
	private String name;
	private int age;
	private String addr;
	private String phone;

	public BeanTest() {
		// 생성 확인용 출력문
		System.out.println("BeanTest() 생성자 호출됨");
	}
	
	// getter setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
