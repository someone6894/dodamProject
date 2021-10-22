package com.dodam.domain.members;

import java.sql.Timestamp;

public class MemberVo {
	private String userid;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private Timestamp regdate;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(String userid, String password, String name, String nickname, String email, String phone,
			Timestamp regdate) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", email=" + email + ", phone=" + phone + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
