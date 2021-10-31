package com.dodam.service.admin;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.members.MemberVo;

public interface AdminService {

	Map<String, Object> selectAllMembers(int pageNo) throws Exception;

	MemberVo getMemberInfo(String userid);

	String getMemberGrade(MemberVo mem) throws NamingException, SQLException;

}
