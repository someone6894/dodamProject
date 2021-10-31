package com.dodam.persistence.admin;

import java.util.List;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;

public interface AdminDAO {

	int selectCntPost();

	List<MemberVo> selectAllMembers(PagingInfoDTO pi);

}
