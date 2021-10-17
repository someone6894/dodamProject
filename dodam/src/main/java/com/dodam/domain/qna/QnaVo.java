package com.dodam.domain.qna;

import java.sql.Timestamp;

public class QnaVo {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private Timestamp regdate;
	private int readcount;
	private int likecount;
	private String image;
	private String notimage;
	private String thumbimage;

	public QnaVo() {
		super();
	}

	public QnaVo(int no, String title, String writer, String contents, Timestamp regdate, int readcount, int likecount,
			String image, String notimage, String thumbimage) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.readcount = readcount;
		this.likecount = likecount;
		this.image = image;
		this.notimage = notimage;
		this.thumbimage = thumbimage;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNotimage() {
		return notimage;
	}

	public void setNotimage(String notimage) {
		this.notimage = notimage;
	}

	public String getThumbimage() {
		return thumbimage;
	}

	public void setThumbimage(String thumbimage) {
		this.thumbimage = thumbimage;
	}

	@Override
	public String toString() {
		return "QnaVo [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents + ", regdate="
				+ regdate + ", readcount=" + readcount + ", likecount=" + likecount + ", image=" + image + ", notimage="
				+ notimage + ", thumbimage=" + thumbimage + "]";
	}

	

}
