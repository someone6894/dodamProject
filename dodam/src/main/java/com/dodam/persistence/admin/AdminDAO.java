package com.dodam.persistence.admin;

import java.util.List;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.members.MemberVo;
import com.dodam.domain.missing.MissingBoardVo;

public interface AdminDAO {

	List<MemberVo> selectAllMembers(PagingInfoDTO pi);

	int selectCntPost();

	MemberVo selectUserInfo(String userid);

	List<MissingBoardVo> selectMissingBoard(String userid);

	List<AdoptVo> selectAdoptBoard(String userid);

}
