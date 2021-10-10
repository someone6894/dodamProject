package com.dodam.domain.members;

public class MemberVo {
	private String userid;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	
	public MemberVo() {
		super();
	}
	
	public MemberVo(String userid, String password, String name, String nickname, String email, String phone) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
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

	public String getNickName() {
		return nickname;
	}

	public void setNickName(String nickname) {
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

	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", email=" + email
				+ ", phone=" + phone + "]";
	}
	
}
