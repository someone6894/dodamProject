package com.dodam.service.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;

public interface AdminService {
	// 회원 리스트 가져오기
	Map<String, Object> selectAllMembers(int pageNo) throws Exception;

	// 회원 정보 가져오기
	MemberVo getUserInfo(String userid);
	
	// 게시글 리스트 가져오기
	Map<String, Object> getBoardList(String userid, int pageNo, String boardName) throws Exception;

	// 회원 포인트 합계
	int getMemberPoint(String userid) throws NamingException, SQLException;

	// 포인트 적립 내역
	List<MypointVo> pointlist(String userid) throws NamingException, SQLException;

	// 회원 게시글 수
	int getMemberBoard(String userid) throws NamingException, SQLException;

	// 회원 댓글 수
	int getMemberReply(String userid) throws NamingException, SQLException;

}
