package com.dodam.domain.notice;

import java.sql.Timestamp;

public class NoticeReplyVo {
	private int replyno;
	private int no;
	private String writer;
	private String content;
	private Timestamp witerdate;
	
	public NoticeReplyVo() {
		
	}

	public NoticeReplyVo(int replyno, int no, String writer, String content, Timestamp witerdate) {
		super();
		this.replyno = replyno;
		this.no = no;
		this.writer = writer;
		this.content = content;
		this.witerdate = witerdate;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWiterdate() {
		return witerdate;
	}

	public void setWiterdate(Timestamp witerdate) {
		this.witerdate = witerdate;
	}

	@Override
	public String toString() {
		return "NoticeReplyVo [replyno=" + replyno + ", no=" + no + ", writer=" + writer + ", content=" + content
				+ ", witerdate=" + witerdate + "]";
	}
	
	
	
}
