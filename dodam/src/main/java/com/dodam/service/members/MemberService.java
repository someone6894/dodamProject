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

	// 회원 가입
	public boolean addMember(MemberVo m);
	
	// 회원 이메일 인증 코드 보내기
//	public boolean sendMail(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException;

	// 회원 로그인 아이디 비밀번호 검사
	MemberVo loginMember(MemberVo mem);
	
	// 회원 아이디 비밀번호 찾기
	MemberVo findMember(String email);

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

	// 비밀번호 찾기, 새로운 임시비밀번호로 회원 정보 변경
	public boolean updateTmpPwd(MemberVo mem);

	
	public int countpoint(String userid) throws NamingException, SQLException;

	// 회원가입시 중복 아이디 확인
	MemberVo checkId(String userid);

	
	
	
}
