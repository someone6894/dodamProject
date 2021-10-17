package com.dodam.domain.notice;

import java.sql.Timestamp;

public class NoticeVo {

	private int no;
	private String writer;
	private String title;
	private String contents;
	private String img;
	private int viewcount;
	private Timestamp writedate;
	
	public NoticeVo() {
		
	}

	public NoticeVo(int no, String writer, String title, String contents, String img, int viewcount,
			Timestamp writedate) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.img = img;
		this.viewcount = viewcount;
		this.writedate = writedate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public Timestamp getWritedate() {
		return writedate;
	}

	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}

	@Override
	public String toString() {
		return "NoticeVo [no=" + no + ", writer=" + writer + ", title=" + title + ", contents=" + contents + ", img="
				+ img + ", viewcount=" + viewcount + ", writedate=" + writedate + "]";
	}
	
	
	
}
