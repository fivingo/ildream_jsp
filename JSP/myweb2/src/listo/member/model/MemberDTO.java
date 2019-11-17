package listo.member.model;

import java.sql.Date;

public class MemberDTO {
	private int midx;
	private String mid;
	private String mpwd;
	private String mname;
	private String memail;
	private String maddr;
	private Date mjoinDate;
	
	public MemberDTO() {
		super();
	}
	public MemberDTO(int midx, String mid, String mpwd, String mname, String memail, String maddr, Date mjoinDate) {
		super();
		this.midx = midx;
		this.mid = mid;
		this.mpwd = mpwd;
		this.mname = mname;
		this.memail = memail;
		this.maddr = maddr;
		this.mjoinDate = mjoinDate;
	}
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public Date getMjoinDate() {
		return mjoinDate;
	}
	public void setMjoinDate(Date mjoinDate) {
		this.mjoinDate = mjoinDate;
	}
}
