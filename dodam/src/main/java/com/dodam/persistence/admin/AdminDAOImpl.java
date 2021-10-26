package com.dodam.persistence.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.members.MemberVo;
import com.dodam.domain.missing.MissingBoardVo;

@Repository
public class AdminDAOImpl implements AdminDAO {

	private String ns = "com.dodam.mappers.AdminMapper";
	
	@Inject
	private SqlSession ses;
	
	@Override
	public List<MemberVo> selectAllMembers(PagingInfoDTO pi) {
		return ses.selectList(ns + ".selectAllMembers", pi);
	}

	@Override
	public int selectCntPost() {
		return ses.selectOne(ns + ".selectCnt");
	}

	@Override
	public MemberVo selectUserInfo(String userid) {
		return ses.selectOne(ns + ".selectUserInfo", userid);
	}
}
