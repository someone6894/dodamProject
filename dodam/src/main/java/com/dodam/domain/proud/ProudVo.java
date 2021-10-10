package com.dodam.domain.proud;

import java.sql.Timestamp;

public class ProudVo {
	private int no;
	private String title;
	private String writer;
	private String content;
	private Timestamp postdate;
	private int likecount;
	private int readcount;
	private String image;
	private String noimage;
	private String thumbimage;
	
	public ProudVo() {
		super();
	}

	public ProudVo(int no, String title, String writer, String content, Timestamp postdate, int likecount,
			int readcount, String image, String noimage, String thumbimage) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.postdate = postdate;
		this.likecount = likecount;
		this.readcount = readcount;
		this.image = image;
		this.noimage = noimage;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPostdate() {
		return postdate;
	}

	public void setPostdate(Timestamp postdate) {
		this.postdate = postdate;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNoimage() {
		return noimage;
	}

	public void setNoimage(String noimage) {
		this.noimage = noimage;
	}

	public String getThumbimage() {
		return thumbimage;
	}

	public void setThumbimage(String thumbimage) {
		this.thumbimage = thumbimage;
	}

	@Override
	public String toString() {
		return "ProudVo [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", postdate="
				+ postdate + ", likecount=" + likecount + ", readcount=" + readcount + ", image=" + image + ", noimage="
				+ noimage + ", thumbimage=" + thumbimage + "]";
	}

}

