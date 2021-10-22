package com.dodam.domain.qna;

import java.sql.Timestamp;

public class QnaReplyVo {
	private int no;
	private int bno;
	private String replyer;
	private String contents;
	private Timestamp regdate;
	

	
	public QnaReplyVo() {
		super();
	}


	public QnaReplyVo(int no, int bno, String replyer, String contents, Timestamp regdate) {
		super();
		this.no = no;
		this.bno = bno;
		this.replyer = replyer;
		this.contents = contents;
		this.regdate = regdate;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getReplyer() {
		return replyer;
	}


	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "QnaReply [no=" + no + ", bno=" + bno + ", replyer=" + replyer + ", contents=" + contents + ", regdate="
				+ regdate + "]";
	}
	
	
}
