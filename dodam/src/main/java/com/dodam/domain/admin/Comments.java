package com.dodam.domain.admin;

import java.sql.Timestamp;

public class Comments {
	private String title;
	private int no;
	private int pno;
	private String recontents;
	private String pcontents;
	private String replyer;
	private Timestamp lastmodfieddate;
	private char isdeleted;
	public Comments() {
		super();
	}
	public Comments(String title, int no, int pno, String recontents, String pcontents, String replyer,
			Timestamp lastmodfieddate, char isdeleted) {
		super();
		this.title = title;
		this.no = no;
		this.pno = pno;
		this.recontents = recontents;
		this.pcontents = pcontents;
		this.replyer = replyer;
		this.lastmodfieddate = lastmodfieddate;
		this.isdeleted = isdeleted;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getRecontents() {
		return recontents;
	}
	public void setRecontents(String recontents) {
		this.recontents = recontents;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Timestamp getLastmodfieddate() {
		return lastmodfieddate;
	}
	public void setLastmodfieddate(Timestamp lastmodfieddate) {
		this.lastmodfieddate = lastmodfieddate;
	}
	public char getIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(char isdeleted) {
		this.isdeleted = isdeleted;
	}
	@Override
	public String toString() {
		return "Comments [title=" + title + ", no=" + no + ", pno=" + pno + ", recontents=" + recontents
				+ ", pcontents=" + pcontents + ", replyer=" + replyer + ", lastmodfieddate=" + lastmodfieddate
				+ ", isdeleted=" + isdeleted + "]";
	}
	
	
}
