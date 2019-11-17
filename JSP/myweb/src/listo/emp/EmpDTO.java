package listo.emp;
// DTO (=VO): 데이터 전송 객체 (Data transfer object)
public class EmpDTO {
	// property / column
	private int eidx;
	private String ename;
	private String eemail;
	private String edept;
	
	public EmpDTO() {
	}
	
	public EmpDTO(int eidx, String ename, String eemail, String edept) {
		super();
		this.eidx = eidx;
		this.ename = ename;
		this.eemail = eemail;
		this.edept = edept;
	}
	
	public int getEidx() {
		return eidx;
	}
	public void setEidx(int eidx) {
		this.eidx = eidx;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEemail() {
		return eemail;
	}
	public void setEemail(String eemail) {
		this.eemail = eemail;
	}
	public String getEdept() {
		return edept;
	}
	public void setEdept(String edept) {
		this.edept = edept;
	}
}
