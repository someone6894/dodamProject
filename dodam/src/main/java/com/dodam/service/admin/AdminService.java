package com.dodam.service.admin;

import java.util.Map;

import com.dodam.domain.members.MemberVo;

public interface AdminService {
	// 회원 리스트 가져오기
	Map<String, Object> selectAllMembers(int pageNo) throws Exception;

	// 회원 정보 가져오기
	MemberVo getUserInfo(String userid);
	
	// 게시글 리스트 가져오기
	Map<String, Object> getBoardList(String userid, int pageNo, String boardName) throws Exception;

}
