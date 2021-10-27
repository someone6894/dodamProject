package com.dodam.domain.proud;

public class LikeHistory {
	private String userid;
	private int no;
	
	public LikeHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikeHistory(String userid, int no) {
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
		return "LikeHistory [userid=" + userid + ", no=" + no + "]";
	}
	
	
	
}
