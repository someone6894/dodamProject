package com.dodam.domain.missing;

public class LikeHistoryVo {
	private String userid;
	private int no;
	public LikeHistoryVo() {
		super();
	}
	public LikeHistoryVo(String userid, int no) {
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
		return "LikeHistoryVo [userid=" + userid + ", no=" + no + "]";
	}
	
}
