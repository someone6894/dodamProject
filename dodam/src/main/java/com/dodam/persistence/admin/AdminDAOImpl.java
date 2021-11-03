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
	public List<Comments> getMissingComments(PagingInfoDTO pi) {
		return ses.selectList(ns+".selectMComments", pi);
	}

	@Override
	public int cntMissingComment() {
		return ses.selectOne(ns + ".selectCntMComments");
	}

	@Override
	public List<MemberVo> searchMembers(Map<String, Object> param) {
		return ses.selectList(ns + ".searchMembers", param);
	}
	
	@Override
	public List<Comments> getProudComments(PagingInfoDTO pi) {
		return ses.selectList(ns + ".selectPComments", pi);
	}

	@Override
	public int cntProudComment() {
		return ses.selectOne(ns + ".selectCntPComments");
	}
	
	@Override
	public List<Comments> getQNAComments(PagingInfoDTO pi) {
		return ses.selectList(ns + ".selectQComments", pi);
	}

	@Override
	public int cntQNAComments() {
		return ses.selectOne(ns + ".selectCntQComments");
	}

	@Override
	public int deleteProudComment(int no) {
		return ses.delete(ns + ".deletePComment", no);
	}
	
	@Override
	public int deleteQNAComment(int no) {
		return ses.delete(ns + ".deleteQComment", no);
	}
	
	@Override
	public int deleteMissingComment(int no) {
		return ses.update(ns + ".deleteMComment", no);
	}
}
