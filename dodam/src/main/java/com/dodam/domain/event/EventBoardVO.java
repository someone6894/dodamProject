package com.dodam.domain.event;

import java.sql.Timestamp;

public class EventBoardVO {
	private int no;
	private String title;
	private String admin;
	private String thumbimg;
	private String year;
	private int readcnt;
	private int likecount;
	private String contents;
	private String img;
	private String area;
	private String hostdate;
	private String hostplace;
	private String huge;
	private String company;
	public EventBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventBoardVO(int no, String title, String admin, String thumbimg, String year, int readcnt, int likecount,
			String contents, String img, String area, String hostdate, String hostplace, String huge, String company) {
		super();
		this.no = no;
		this.title = title;
		this.admin = admin;
		this.thumbimg = thumbimg;
		this.year = year;
		this.readcnt = readcnt;
		this.likecount = likecount;
		this.contents = contents;
		this.img = img;
		this.area = area;
		this.hostdate = hostdate;
		this.hostplace = hostplace;
		this.huge = huge;
		this.company = company;
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
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getHostdate() {
		return hostdate;
	}
	public void setHostdate(String hostdate) {
		this.hostdate = hostdate;
	}
	public String getHostplace() {
		return hostplace;
	}
	public void setHostplace(String hostplace) {
		this.hostplace = hostplace;
	}
	public String getHuge() {
		return huge;
	}
	public void setHuge(String huge) {
		this.huge = huge;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "EventBoardVO [no=" + no + ", title=" + title + ", admin=" + admin + ", thumbimg=" + thumbimg + ", year="
				+ year + ", readcnt=" + readcnt + ", likecount=" + likecount + ", contents=" + contents + ", img=" + img
				+ ", area=" + area + ", hostdate=" + hostdate + ", hostplace=" + hostplace + ", huge=" + huge
				+ ", company=" + company + "]";
	}
	
	
}
	