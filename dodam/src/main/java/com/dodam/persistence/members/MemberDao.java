package com.dodam.persistence.members;

import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.naming.NamingException;

import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.proud.ProudVo;

public interface MemberDao {

	public int insertMember(MemberVo mem);
	
	public boolean send(String emailAddr, String confirmCode) throws MessagingException, AddressException;

	MemberVo loginMember(MemberVo mem);
	
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
	
	// 포인트 적립 초기화
	public int countpoint(String userid) throws NamingException, SQLException;
}
