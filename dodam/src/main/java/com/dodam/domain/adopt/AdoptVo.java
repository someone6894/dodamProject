package com.dodam.domain.adopt;

import java.sql.Timestamp;

public class AdoptVo {
	
	private int no;
	private String title;
	private String writer;
	private String password;
	private String adoptkind;
	private String gender;
	private String adoptarea;
	private String liabilityfee;
	private String sns;
	private String phone;
	private String image;
	private String notimage;
	private String thumbimage;
	private String contents;
	private String bookmark;
	private Timestamp regdate;
	private String state;
	private int readcnt;
	private int refno;
	private int step;
	private int reforder;
	
	public AdoptVo() {
		super();
	}

	public AdoptVo(int no, String title, String writer, String password, String adoptkind, String gender,
			String adoptarea, String liabilityfee, String sns, String phone, String image, String notimage,
			String thumbimage, String contents, String bookmark, Timestamp regdate, String state, int readcnt,
			int refno, int step, int reforder) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.password = password;
		this.adoptkind = adoptkind;
		this.gender = gender;
		this.adoptarea = adoptarea;
		this.liabilityfee = liabilityfee;
		this.sns = sns;
		this.phone = phone;
		this.image = image;
		this.notimage = notimage;
		this.thumbimage = thumbimage;
		this.contents = contents;
		this.bookmark = bookmark;
		this.regdate = regdate;
		this.state = state;
		this.readcnt = readcnt;
		this.refno = refno;
		this.step = step;
		this.reforder = reforder;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAdoptkind() {
		return adoptkind;
	}

	public void setAdoptkind(String adoptkind) {
		this.adoptkind = adoptkind;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAdoptarea() {
		return adoptarea;
	}

	public void setAdoptarea(String adoptarea) {
		this.adoptarea = adoptarea;
	}

	public String getLiabilityfee() {
		return liabilityfee;
	}

	public void setLiabilityfee(String liabilityfee) {
		this.liabilityfee = liabilityfee;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getBookmark() {
		return bookmark;
	}

	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getRefno() {
		return refno;
	}

	public void setRefno(int refno) {
		this.refno = refno;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getReforder() {
		return reforder;
	}

	public void setReforder(int reforder) {
		this.reforder = reforder;
	}

	@Override
	public String toString() {
		return "AdoptVo [no=" + no + ", title=" + title + ", writer=" + writer + ", password=" + password
				+ ", adoptkind=" + adoptkind + ", gender=" + gender + ", adoptarea=" + adoptarea + ", liabilityfee="
				+ liabilityfee + ", sns=" + sns + ", phone=" + phone + ", image=" + image + ", notimage=" + notimage
				+ ", thumbimage=" + thumbimage + ", contents=" + contents + ", bookmark=" + bookmark + ", regdate="
				+ regdate + ", state=" + state + ", readcnt=" + readcnt + ", refno=" + refno + ", step=" + step
				+ ", reforder=" + reforder + "]";
	}
	

}
