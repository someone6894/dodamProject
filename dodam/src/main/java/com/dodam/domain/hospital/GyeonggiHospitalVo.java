package com.dodam.domain.hospital;

public class GyeonggiHospitalVo {

	private String city;
	private String hospital;
	private String state;
	private String pyeeobdate;
	private String phonenum;
	private int roadpsotnum;
	private String dolomyeongjuso;
	private String jibeonjuso;
	private int postnum;
	
	public GyeonggiHospitalVo() {
		
	}

	public GyeonggiHospitalVo(String city, String hospital, String state, String pyeeobdate, String phonenum,
			int roadpsotnum, String dolomyeongjuso, String jibeonjuso, int postnum) {
		super();
		this.city = city;
		this.hospital = hospital;
		this.state = state;
		this.pyeeobdate = pyeeobdate;
		this.phonenum = phonenum;
		this.roadpsotnum = roadpsotnum;
		this.dolomyeongjuso = dolomyeongjuso;
		this.jibeonjuso = jibeonjuso;
		this.postnum = postnum;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPyeeobdate() {
		return pyeeobdate;
	}

	public void setPyeeobdate(String pyeeobdate) {
		this.pyeeobdate = pyeeobdate;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public int getRoadpsotnum() {
		return roadpsotnum;
	}

	public void setRoadpsotnum(int roadpsotnum) {
		this.roadpsotnum = roadpsotnum;
	}

	public String getDolomyeongjuso() {
		return dolomyeongjuso;
	}

	public void setDolomyeongjuso(String dolomyeongjuso) {
		this.dolomyeongjuso = dolomyeongjuso;
	}

	public String getJibeonjuso() {
		return jibeonjuso;
	}

	public void setJibeonjuso(String jibeonjuso) {
		this.jibeonjuso = jibeonjuso;
	}

	public int getPostnum() {
		return postnum;
	}

	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}

	@Override
	public String toString() {
		return "GyeonggiHospitalVo [city=" + city + ", hospital=" + hospital + ", state=" + state + ", pyeeobdate="
				+ pyeeobdate + ", phonenum=" + phonenum + ", roadpsotnum=" + roadpsotnum + ", dolomyeongjuso="
				+ dolomyeongjuso + ", jibeonjuso=" + jibeonjuso + ", postnum=" + postnum + "]";
	}

	
	
}
