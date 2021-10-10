package com.dodam.domain.qna;

import java.sql.Timestamp;

public class QnaVo {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private Timestamp regdate;
	
	public QnaVo() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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
		return "QnaVo [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents + ", regdate="
				+ regdate + "]";
	}
	

}
