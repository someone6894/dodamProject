package com.dodam.domain.members;

public class MemberGradeVo {
	private String grade;
	private int memberpoint;
	private int memberpoint2;
	
	public MemberGradeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberGradeVo(String grade, int memberpoint, int memberpoint2) {
		super();
		this.grade = grade;
		this.memberpoint = memberpoint;
		this.memberpoint2 = memberpoint2;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getMemberpoint() {
		return memberpoint;
	}

	public void setMemberpoint(int memberpoint) {
		this.memberpoint = memberpoint;
	}

	public int getMemberpoint2() {
		return memberpoint2;
	}

	public void setMemberpoint2(int memberpoint2) {
		this.memberpoint2 = memberpoint2;
	}

	@Override
	public String toString() {
		return "MemberGradeVo [grade=" + grade + ", memberpoint=" + memberpoint + ", memberpoint2=" + memberpoint2
				+ "]";
	}
	
	
}
