package com.dodam.domain.proud;

import java.sql.Timestamp;

public class ReplyVo {

	private int no;
	private int bno;
	private String contents;
	private String replyer;
	private	Timestamp registerdate;
	private Timestamp modifydate;
	private int likecnt;
	private int ref;
	private int step;
	private String reforder;
	
	public ReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReplyVo(int no, int bno, String contents, String replyer, Timestamp registerdate, Timestamp modifydate,
			int likecnt, int ref, int step, String reforder) {
		super();
		this.no = no;
		this.bno = bno;
		this.contents = contents;
		this.replyer = replyer;
		this.registerdate = registerdate;
		this.modifydate = modifydate;
		this.likecnt = likecnt;
		this.ref = ref;
		this.step = step;
		this.reforder = reforder;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public Timestamp getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}

	public Timestamp getModifydate() {
		return modifydate;
	}

	public void setModifydate(Timestamp modifydate) {
		this.modifydate = modifydate;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getReforder() {
		return reforder;
	}

	public void setReforder(String reforder) {
		this.reforder = reforder;
	}

	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", bno=" + bno + ", contents=" + contents + ", replyer=" + replyer
				+ ", registerdate=" + registerdate + ", modifydate=" + modifydate + ", likecnt=" + likecnt + ", ref="
				+ ref + ", step=" + step + ", reforder=" + reforder + "]";
	}
	
	
	
	
	
	
}
