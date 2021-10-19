package com.dodam.persistence.board.hospital;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.hospital.GyeonggiHospitalVo;
import com.dodam.domain.hospital.SeoulHospitalVo;

public interface HospitalDAO {
	// 서울시 전체 동물병원 리스트 가져오기
		List<SeoulHospitalVo> Allseoullist() throws SQLException, NamingException;

	// 서울시 지역별 동물병원 리스트 가져오기
		List<SeoulHospitalVo> cityseoullist() throws SQLException, NamingException;
		
	// 경기도 전체 동물병원 리스트 가져오기
		List<GyeonggiHospitalVo> Allgyeonggilist() throws SQLException, NamingException;

	// 경기도 지역별 동물병원 리스트 가져오기
		List<GyeonggiHospitalVo> citygyeonggillist() throws SQLException, NamingException;
		
}
