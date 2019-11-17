package listo.bbs.model;

import java.sql.Date;

public class BbsDTO {
	private int bidx;
	private String bwriter;
	private String bpwd;
	private String bsubject;
	private String bcontent;
	private Date bwriteDate;
	private int breadCount;
	private int breference;
	private int blevel;
	private int brank;
	private int brecommend;
	
	public BbsDTO() {
		super();
	}
	
	public BbsDTO(String bwriter, String bpwd, String bsubject, String bcontent) {
		super();
		this.bwriter = bwriter;
		this.bpwd = bpwd;
		this.bsubject = bsubject;
		this.bcontent = bcontent;
	}
	
	public BbsDTO(String bsubject, int breference, int blevel, int brank) {
		super();
		this.bsubject = bsubject;
		this.breference = breference;
		this.blevel = blevel;
		this.brank = brank;
	}

	public BbsDTO(int bidx, String bwriter, String bpwd, String bsubject, String bcontent, Date bwriteDate,
			int breadCount, int breference, int blevel, int brank, int brecommend) {
		super();
		this.bidx = bidx;
		this.bwriter = bwriter;
		this.bpwd = bpwd;
		this.bsubject = bsubject;
		this.bcontent = bcontent;
		this.bwriteDate = bwriteDate;
		this.breadCount = breadCount;
		this.breference = breference;
		this.blevel = blevel;
		this.brank = brank;
		this.brecommend = brecommend;
	}
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBpwd() {
		return bpwd;
	}
	public void setBpwd(String bpwd) {
		this.bpwd = bpwd;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBwriteDate() {
		return bwriteDate;
	}
	public void setBwriteDate(Date bwriteDate) {
		this.bwriteDate = bwriteDate;
	}
	public int getBreadCount() {
		return breadCount;
	}
	public void setBreadCount(int breadCount) {
		this.breadCount = breadCount;
	}
	public int getBreference() {
		return breference;
	}
	public void setBreference(int breference) {
		this.breference = breference;
	}
	public int getBlevel() {
		return blevel;
	}
	public void setBlevel(int blevel) {
		this.blevel = blevel;
	}
	public int getBrank() {
		return brank;
	}
	public void setBrank(int brank) {
		this.brank = brank;
	}
	public int getBrecommend() {
		return brecommend;
	}
	public void setBrecommend(int brecommend) {
		this.brecommend = brecommend;
	}
}
