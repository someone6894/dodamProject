package com.dodam.persistence.admin;

import java.util.List;
import java.util.Map;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.members.MemberVo;

public interface AdminDAO {

	// 회원 명단 조회
	List<MemberVo> selectAllMembers(PagingInfoDTO pi);

	// 회원 수 조회
	int selectCntPost();

	// 회원 정보 조회
	MemberVo selectUserInfo(String userid);


}
