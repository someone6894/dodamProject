package com.dodam.domain.missing;

public class BookmarkVo {
	private String userid;
	private int no;
	public BookmarkVo() {
		super();
	}
	public BookmarkVo(String userid, int no) {
		super();
		this.userid = userid;
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "BookmarkVo [userid=" + userid + ", no=" + no + "]";
	}
	
}
