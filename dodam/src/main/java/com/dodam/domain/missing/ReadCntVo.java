package com.dodam.domain.missing;

import java.sql.Timestamp;

public class ReadCntVo {
	private int readno;
	private String ipaddress;
	private Timestamp readtime;
	private String userid;
	public ReadCntVo() {
		super();
	}
	public ReadCntVo(int readno, String ipaddress, Timestamp readtime, String userid) {
		super();
		this.readno = readno;
		this.ipaddress = ipaddress;
		this.readtime = readtime;
		this.userid = userid;
	}
	public int getReadno() {
		return readno;
	}
	public void setReadno(int readno) {
		this.readno = readno;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public Timestamp getReadtime() {
		return readtime;
	}
	public void setReadtime(Timestamp readtime) {
		this.readtime = readtime;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "ReadCntVo [readno=" + readno + ", ipaddress=" + ipaddress + ", readtime=" + readtime + ", userid="
				+ userid + "]";
	}
	
	
}
