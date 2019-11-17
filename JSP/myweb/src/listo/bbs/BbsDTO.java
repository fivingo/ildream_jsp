package listo.bbs;

import java.sql.Date;

public class BbsDTO {
	private int bidx;			// 인덱스
	private String bwriter;		// 글쓴이
	private String bpwd;		// 비밀번호
	private String bsubject;	// 제목
	private String bcontent;	// 내용
	private Date bwriteDate;	// 작성날짜
	private int breadCount;		// 조회수
	private int breference;		// ref
	private int blevel;			// lev
	private int brank;			// sunbun
	private int brecommend;		// 추천수
	
	public BbsDTO() {
		
	}

	public BbsDTO(int bidx, String bwriter, String bsubject, int breadCount) {
		super();
		this.bidx = bidx;
		this.bwriter = bwriter;
		this.bsubject = bsubject;
		this.breadCount = breadCount;
	}
	
	public BbsDTO(int bidx, String bwriter, String bsubject, String bcontent) {
		super();
		this.bidx = bidx;
		this.bwriter = bwriter;
		this.bsubject = bsubject;
		this.bcontent = bcontent;
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
