package yong.member.model;

import java.sql.Date;

public class MemberDTO {
	private int midx;
	private String mid;
	private String mname;
	private String mpwd;
	private String memail;
	private String maddr;
	private Date mdate;
	
	public MemberDTO() {
		super();
	}
	public MemberDTO(int midx, String mid, String mname, String mpwd, String memail, String maddr, Date mdate) {
		super();
		this.midx = midx;
		this.mid = mid;
		this.mname = mname;
		this.mpwd = mpwd;
		this.memail = memail;
		this.maddr = maddr;
		this.mdate = mdate;
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
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
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
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
}
