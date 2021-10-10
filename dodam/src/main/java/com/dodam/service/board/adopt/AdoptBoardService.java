package com.dodam.service.board.adopt;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.adopt.AdoptVo;

public interface AdoptBoardService {

	
	    // Create
		// 게시판에 글 저장 하기
		boolean addBoard(AdoptVo bo) throws NamingException, SQLException;
//
//		// Read
//		// 게시판 전체 글 불러오기
//		Map<String, Object> readAllBoard(int pageNo) throws NamingException, SQLException;

//		AdoptVo readAllBoard() throws NamingException, SQLException;
	
		// 유기동물 분양 유저 게시판 전체 리스트 출력하기
		Map<String, Object> readAllAdopt(int pageNo) throws NamingException, SQLException;

		
		// 유기동물 분양 유저 게시판 상세페이지 출력하기
		AdoptVo readBoard(int no) throws NamingException, SQLException;
		
		
		// 유기동물 공고 게시판 전체 리스트 출력하기
//		Map<String, Object> readAllAdoptPublic() throws NamingException, SQLException;

		// adoptboarduser 게시글 삭제
		void removeBoard(int no) throws NamingException, SQLException;

		// adoptboarduser 게시글 수정
		boolean updateBoard(AdoptVo bo) throws NamingException, SQLException;


		// 게시물 불러오기 번호로
//		BoardVo readBoard(int no) throws NamingException, SQLException;
		
}
