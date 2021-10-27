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
	private Timestamp modifydate;
	private String sessionid;
	private String sessionage;
	private String isadmin;
	
	
	public MemberVo() {
		super();
	}

	public MemberVo(String userid, String password, String name, String nickname, String email, String phone,
			Timestamp regdate, Timestamp modifydate, String sessionid, String sessionage, String isadmin) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
		this.modifydate = modifydate;
		this.sessionid = sessionid;
		this.sessionage = sessionage;
		this.isadmin = isadmin;
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

	public Timestamp getModifydate() {
		return modifydate;
	}

	public void setModifydate(Timestamp modifydate) {
		this.modifydate = modifydate;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getSessionage() {
		return sessionage;
	}

	public void setSessionage(String sessionage) {
		this.sessionage = sessionage;
	}

	public String getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}

	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", email=" + email + ", phone=" + phone + ", regdate=" + regdate + ", modifydate=" + modifydate
				+ ", sessionid=" + sessionid + ", sessionage=" + sessionage + ", isadmin=" + isadmin + "]";
	}
	
}
