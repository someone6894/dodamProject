package com.dodam.persistence.admin;

import java.util.List;
import java.util.Map;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.members.MemberVo;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.proud.ProudVo;
import com.dodam.domain.qna.QnaVo;

public interface AdminDAO {

	// 회원 명단 조회
	List<MemberVo> selectAllMembers(PagingInfoDTO pi);

	// 회원 수 조회
	int selectCntPost();

	// 회원 정보 조회
	MemberVo selectUserInfo(String userid);

	// missingboard테이블의 게시물 조회
	List<MissingBoardVo> selectMissingBoard(Map<String, Object> map);

	// adoptboarduser테이블의 게시물 조회
	List<AdoptVo> selectAdoptBoard(Map<String, Object> map);

	// proudboard테이블의 게시물 조회
	List<ProudVo> selectProudBoard(Map<String, Object> map);

	// qna테이블의 게시물 조회
	List<QnaVo> selectQNABoard(Map<String, Object> map);

	// missingboard테이블 게시물 수 조회
	int selectMissingCntPost();

	// adoptboarduser테이블의 게시물 수 조회
	int selectAdoptCntPost();

	// proudboard테이블의 게시물 수 조회
	int selectProudCntPost();

	// qna테이블의 게시물 수 조회
	int selectQNACntPost();
	
	


}
