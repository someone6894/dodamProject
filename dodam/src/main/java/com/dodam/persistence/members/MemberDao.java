package com.dodam.persistence.members;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.naming.NamingException;

import com.dodam.domain.members.MemberGradeVo;
import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.proud.ProudVo;

public interface MemberDao {
	
	// 회원 등록
	public int insertMember(MemberVo mem);
	
	// 회원 이메일 확인 코드 보내기
//	public boolean send(String emailAddr, String confirmCode) throws MessagingException, AddressException;

	// 회원 로그인 아이디/비밀번호 검사
	MemberVo loginMember(MemberVo mem);
	
	// 회원 아이디/비밀번호 찾기
	MemberVo findMember(String email);
	
	// 회원 정보 수정
	int infoupdate(MemberVo mem) throws NamingException, SQLException;

	// 회원 비밀번호 수정
	int passwordupdate(MemberVo mem) throws NamingException, SQLException;
	
	// 회원 탈퇴
	int deleteAccount(MemberVo mem) throws NamingException, SQLException;
	
	// 적립 포인트 합
	int sumpoint(String userid) throws NamingException, SQLException;

	// 적립 내역
	List<MypointVo> pointlist(String userid) throws NamingException, SQLException;

	// 게시판 작성 내역
	List<MypointVo> boardhistory(String userid) throws NamingException, SQLException;
	
	// 댓글 작성 내역
	List<MypointVo> replyerhistory(String userid) throws NamingException, SQLException;
	
	// 게시글 작성 개수
	int countboard(String userid) throws NamingException, SQLException;

	// 댓글 작성 개수
	int countreplyer(String userid) throws NamingException, SQLException;
	
	// 북마크 작성 개수
	int bookmarkcount(String userid) throws NamingException, SQLException;

	// 비밀번호 찾기, 새로운 임시비밀번호로 회원 정보 변경 
	int updateTmpPwd(MemberVo mem);

	// 북마크 기록
	List<MemberGradeVo> bookmark(String userid) throws NamingException, SQLException;

	// 댓글 작성 내역
	List<MemberGradeVo> membergrade() throws NamingException, SQLException;
	
	// 등급 가져오기
	public String grade(int sumpoint) throws NamingException, SQLException;
	
	// 포인트 적립 초기화
	public int countpoint(String userid) throws NamingException, SQLException;

	// 회원가입시 중복 아이디 확인
	MemberVo checkDupliactedId(String userid);

	// 비밀번호 변경시 기존 비밀번호 확인
	MemberVo pwdCheck(Map<String, String> map);
}
