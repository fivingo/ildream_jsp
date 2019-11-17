package yong.order.model;

public class ItemDTO {
	private String name;
	private int num;
	private String bigo;
	
	public ItemDTO() {
		super();
	}
	public ItemDTO(String name, int num, String bigo) {
		super();
		this.name = name;
		this.num = num;
		this.bigo = bigo;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBigo() {
		return bigo;
	}
	public void setBigo(String bigo) {
		this.bigo = bigo;
	}
}
