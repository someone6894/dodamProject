package com.dodam.service.members;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;

public interface MemberService {

	public boolean addMember(MemberVo m);
	
	public boolean sendMail(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

	MemberVo loginMember(MemberVo mem);
	

	// 회원 정보 수정
	boolean infoupdate(MemberVo m) throws NamingException, SQLException;
	
	// 회원 비밀번호 변경
	boolean passwordupdate(MemberVo m) throws NamingException, SQLException;
	
	// 회원 탈퇴
	boolean deleteAccount(MemberVo m) throws NamingException, SQLException;

	// 현재 적립된 포인트
	public int sumpoint(String userid) throws NamingException, SQLException;

	public Map<String, Object> pointlist(String userid) throws NamingException, SQLException;

	public int countboard(String userid) throws NamingException, SQLException;

	public int countreplyer(String userid) throws NamingException, SQLException;

	public Map<String, Object> boardhistory(String userid) throws NamingException, SQLException;

	public Map<String, Object> replyerhistory(String userid) throws NamingException, SQLException;

	public int countpoint(String userid) throws NamingException, SQLException;

	
	
	
}
