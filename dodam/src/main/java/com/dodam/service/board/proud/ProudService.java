package com.dodam.service.board.proud;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.LikeHistory;
import com.dodam.domain.proud.ProudVo;

public interface ProudService {

	//  CREATE
	// 게시판에 글 저장하기
	boolean addBoard(ProudVo bo) throws NamingException, SQLException;
	
	// 포인트 적립
	boolean addpoint(MypointVo vo) throws NamingException, SQLException;

	
	//  READ
	// 게시판 전체글 조회 (페이징)
	Map<String, Object> readAllBoard(int pageNo, String type, String word) throws NamingException, SQLException;

	// 상세 페이지 조회
	ProudVo readBoard(int no) throws NamingException, SQLException;
	
		
	//  UPDATE
	// 게시판 글 수정하기
	boolean updateBoard(ProudVo bo) throws NamingException, SQLException;
	
	
	//  DELETE
	// 게시판 글 삭제하기
	boolean deleteBoard(int no) throws NamingException, SQLException;

	boolean readcount(int no) throws NamingException, SQLException;

	boolean like(LikeHistory vo, String userid) throws NamingException, SQLException;

	boolean dislike(LikeHistory vo, String userid) throws NamingException, SQLException;

	int likehistory(int no, String userid) throws NamingException, SQLException;

	void likeup(LikeHistory vo) throws NamingException, SQLException;

	void likedown(LikeHistory vo) throws NamingException, SQLException;
	
	
	
}
