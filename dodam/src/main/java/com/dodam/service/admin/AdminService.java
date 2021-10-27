package com.dodam.service.admin;

import java.util.Map;

import com.dodam.domain.members.MemberVo;

public interface AdminService {

	Map<String, Object> selectAllMembers(int pageNo) throws Exception;

	MemberVo getUserInfo(String userid);

}
