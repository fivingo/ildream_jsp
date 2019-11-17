package listo.guestbook;

import java.sql.Date;

public class GuestDTO {
	private int gidx;			// 인덱스
	private String gid;			// 아이디
	private String gcontent;	// 내용
	private Date gwriteDate;	// 작성일
	private int gcomCount;		// 댓글 수
	private int gcomRef;		// 댓글 그룹
	private String gipAddr;		// ip 주소
	
	public GuestDTO() {
	}
	public GuestDTO(int gidx, String gid, String gcontent, Date gwriteDate, int gcomCount, int gcomRef,
			String gipAddr) {
		super();
		this.gidx = gidx;
		this.gid = gid;
		this.gcontent = gcontent;
		this.gwriteDate = gwriteDate;
		this.gcomCount = gcomCount;
		this.gcomRef = gcomRef;
		this.gipAddr = gipAddr;
	}

	public int getGidx() {
		return gidx;
	}
	public void setGidx(int gidx) {
		this.gidx = gidx;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGcontent() {
		return gcontent;
	}
	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}
	public Date getGwriteDate() {
		return gwriteDate;
	}
	public void setGwriteDate(Date gwriteDate) {
		this.gwriteDate = gwriteDate;
	}
	public int getGcomCount() {
		return gcomCount;
	}
	public void setGcomCount(int gcomCount) {
		this.gcomCount = gcomCount;
	}
	public int getGcomRef() {
		return gcomRef;
	}
	public void setGcomRef(int gcomRef) {
		this.gcomRef = gcomRef;
	}
	public String getGipAddr() {
		return gipAddr;
	}
	public void setGipAddr(String gipAddr) {
		this.gipAddr = gipAddr;
	}
}
