package com.dodam.persistence.board.hospital;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.hospital.GyeonggiHospitalVo;
import com.dodam.domain.hospital.SeoulHospitalVo;

@Repository
public class HospitalDAOImpl implements HospitalDAO {

	private static String namespace = "com.dodam.mapper.hospitalMapper";
	
	@Inject
	private SqlSession ses;
	
	@Override
	public List<SeoulHospitalVo> Allseoullist() throws SQLException, NamingException {	//서울시 전체 병원리스트 가져오기
		return ses.selectList(namespace + ".Allseoullist");
	}

	@Override
	public List<SeoulHospitalVo> cityseoullist() throws SQLException, NamingException {	// 서울시 지역별 동물병원 리스트 가져오기
		return ses.selectList(namespace + ".cityseoullist");
	}

	@Override
	public List<GyeonggiHospitalVo> Allgyeonggilist() throws SQLException, NamingException {	// 경기도 전체 동물병원 리스트 가져오기
		return ses.selectList(namespace + ".Allgyeonggilist");
	}

	@Override
	public List<GyeonggiHospitalVo> citygyeonggillist() throws SQLException, NamingException { 	// 경기도 지역별 동물병원 리스트 가져오기
		return ses.selectList(namespace + ".citygyeonggillist");
	}

}
