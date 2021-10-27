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
import com.dodam.domain.proud.ProudVo;
import com.dodam.domain.qna.QnaVo;

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

	@Override
	public List<MissingBoardVo> selectMissingBoard(Map<String, Object> map) {
		return ses.selectList(ns + ".selectMissingBoard", map);
	}

	@Override
	public List<AdoptVo> selectAdoptBoard(Map<String, Object> map) {
		return ses.selectList(ns + ".selectAdoptBoard", map);
	}

	@Override
	public List<ProudVo> selectProudBoard(Map<String, Object> map) {
		return ses.selectList(ns + ".selectProudBoard", map);
	}

	@Override
	public List<QnaVo> selectQNABoard(Map<String, Object> map) {
		return ses.selectList(ns + ".selectQnaBoard", map);
	}

	@Override
	public int selectMissingCntPost() {
		return ses.selectOne(ns + ".selectMissingCntPost");
	}

	@Override
	public int selectAdoptCntPost() {
		return ses.selectOne(ns + ".selectAdoptCntPost");
	}

	@Override
	public int selectProudCntPost() {
		return ses.selectOne(ns + ".selectProudCntPost");
	}

	@Override
	public int selectQNACntPost() {
		return ses.selectOne(ns + ".selectQnaCntPost");
	}
}
