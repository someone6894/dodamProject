package com.dodam.persistence.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession ses;
	
	private String ns = "com.dodam.mappers.AdminMapper";

	@Override
	public int selectCntPost() {
		return ses.selectOne(ns + ".selectCntAll");
	}

	@Override
	public List<MemberVo> selectAllMembers(PagingInfoDTO pi) {
		return ses.selectList(ns + ".selectAllMembers", pi);
	}
}
