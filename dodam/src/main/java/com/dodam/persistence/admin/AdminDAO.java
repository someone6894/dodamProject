package com.dodam.persistence.admin;

import java.util.List;
import java.util.Map;

import com.dodam.domain.admin.Comments;
import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;

public interface AdminDAO {

	int selectCntUser(String searchId);

	List<MemberVo> selectAllMembers(PagingInfoDTO pi);

	List<Comments> getMissingCommnets();

	int cntMissingComment();

	List<MemberVo> searchMembers(Map<String, Object> param);

}
