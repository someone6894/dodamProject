package com.dodam.service.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.admin.Comments;
import com.dodam.domain.members.MemberVo;

public interface AdminService {

	Map<String, Object> selectAllMembers(int pageNo) throws Exception;

	MemberVo getMemberInfo(String userid);

	String getMemberGrade(MemberVo mem) throws NamingException, SQLException;

	boolean infoupdate(MemberVo member) throws NamingException, SQLException;

	boolean pwdCheck(String password, String password2);

	List<Comments> getMissingComments();

	int cntMissingComment();

	boolean changePwd(String userid, String password) throws NamingException, SQLException;

	boolean deleteUser(String userid) throws NamingException, SQLException;

	Map<String, Object> searchMembers(int PageNo, String searchId) throws Exception;

}
