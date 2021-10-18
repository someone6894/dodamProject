package com.dodam.domain.hospital;

public class SeoulHospitalVo {
	private String state;
	private String pyeeobdate;
	private String hyueobstart;
	private int hyueobend;
	private String restartdate;
	private String phonenum;
	private String city;
	private String jibeonjuso;
	private String dolomyeongjuso;
	private int roadpsotnum;
	private String hospital;
	
	public SeoulHospitalVo() {
		
	}
	
	public SeoulHospitalVo(String state, String pyeeobdate, String hyueobstart, int hyueobend, String restartdate,
			String phonenum, String city, String jibeonjuso, String dolomyeongjuso, int roadpsotnum, String hospital) {
		super();
		this.state = state;
		this.pyeeobdate = pyeeobdate;
		this.hyueobstart = hyueobstart;
		this.hyueobend = hyueobend;
		this.restartdate = restartdate;
		this.phonenum = phonenum;
		this.city = city;
		this.jibeonjuso = jibeonjuso;
		this.dolomyeongjuso = dolomyeongjuso;
		this.roadpsotnum = roadpsotnum;
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

	public String getHyueobstart() {
		return hyueobstart;
	}

	public void setHyueobstart(String hyueobstart) {
		this.hyueobstart = hyueobstart;
	}

	public int getHyueobend() {
		return hyueobend;
	}

	public void setHyueobend(int hyueobend) {
		this.hyueobend = hyueobend;
	}

	public String getRestartdate() {
		return restartdate;
	}

	public void setRestartdate(String restartdate) {
		this.restartdate = restartdate;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getJibeonjuso() {
		return jibeonjuso;
	}

	public void setJibeonjuso(String jibeonjuso) {
		this.jibeonjuso = jibeonjuso;
	}

	public String getDolomyeongjuso() {
		return dolomyeongjuso;
	}

	public void setDolomyeongjuso(String dolomyeongjuso) {
		this.dolomyeongjuso = dolomyeongjuso;
	}

	public int getRoadpsotnum() {
		return roadpsotnum;
	}

	public void setRoadpsotnum(int roadpsotnum) {
		this.roadpsotnum = roadpsotnum;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	@Override
	public String toString() {
		return "SeoulHospitalVo [state=" + state + ", pyeeobdate=" + pyeeobdate + ", hyueobstart=" + hyueobstart
				+ ", hyueobend=" + hyueobend + ", restartdate=" + restartdate + ", phonenum=" + phonenum + ", city="
				+ city + ", jibeonjuso=" + jibeonjuso + ", dolomyeongjuso=" + dolomyeongjuso + ", roadpsotnum="
				+ roadpsotnum + ", hospital=" + hospital + "]";
	}
	
	
	
}
