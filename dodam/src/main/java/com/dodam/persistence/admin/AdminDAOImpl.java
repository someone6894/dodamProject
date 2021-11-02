package com.dodam.persistence.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.admin.Comments;
import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession ses;
	
	private String ns = "com.dodam.mappers.AdminMapper";

	@Override
	public int selectCntUser(String searchId) {
		return ses.selectOne(ns + ".selectCntAll", searchId);
	}

	@Override
	public List<MemberVo> selectAllMembers(PagingInfoDTO pi) {
		return ses.selectList(ns + ".selectAllMembers", pi);
	}

	@Override
	public List<Comments> getMissingCommnets() {
		return ses.selectList(ns+".selectMComments");
	}

	@Override
	public int cntMissingComment() {
		return ses.selectOne(ns + ".selectCntMComments");
	}

	@Override
	public List<MemberVo> searchMembers(Map<String, Object> param) {
		return ses.selectList(ns + ".searchMembers", param);
	}
}
