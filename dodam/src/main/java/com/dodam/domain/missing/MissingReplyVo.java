package com.dodam.domain.missing;

import java.sql.Timestamp;

public class MissingReplyVo {
	private int no; // 댓글 테이블 pk
	private int pno; // 부모글 fk
	private String contents;
	private String replyer;
	private Timestamp lastmodifieddate;
	private char issecret;
	private char ismodified;
	private char isdeleted;
	private int pid;
	private int depth;
	private String reforder;
	public MissingReplyVo() {
		super();
	}
	public MissingReplyVo(int no, int pno, String contents, String replyer, Timestamp lastmodifieddate, char issecret,
			char ismodified, char isdeleted, int pid, int depth, String reforder) {
		super();
		this.no = no;
		this.pno = pno;
		this.contents = contents;
		this.replyer = replyer;
		this.lastmodifieddate = lastmodifieddate;
		this.issecret = issecret;
		this.ismodified = ismodified;
		this.isdeleted = isdeleted;
		this.pid = pid;
		this.depth = depth;
		this.reforder = reforder;
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
	public Timestamp getLastmodifieddate() {
		return lastmodifieddate;
	}
	public void setLastmodifieddate(Timestamp lastmodifieddate) {
		this.lastmodifieddate = lastmodifieddate;
	}
	public char getIssecret() {
		return issecret;
	}
	public void setIssecret(char issecret) {
		this.issecret = issecret;
	}
	public char getIsmodified() {
		return ismodified;
	}
	public void setIsmodified(char ismodified) {
		this.ismodified = ismodified;
	}
	public char getIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(char isdeleted) {
		this.isdeleted = isdeleted;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getReforder() {
		return reforder;
	}
	public void setReforder(String reforder) {
		this.reforder = reforder;
	}
	@Override
	public String toString() {
		return "MissingReplyVo [no=" + no + ", pno=" + pno + ", contents=" + contents + ", replyer=" + replyer
				+ ", lastmodifieddate=" + lastmodifieddate + ", issecret=" + issecret + ", ismodified=" + ismodified
				+ ", isdeleted=" + isdeleted + ", pid=" + pid + ", depth=" + depth + ", reforder=" + reforder + "]";
	}
		
}