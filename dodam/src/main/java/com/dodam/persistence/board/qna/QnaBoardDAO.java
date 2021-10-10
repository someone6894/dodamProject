package com.dodam.persistence.board.qna;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.qna.QnaVo;


public interface QnaBoardDAO {
	// Create
		// 게시판에 글 저장 하기 
//	내가하는 작업
		int insertBoardVo(QnaVo vo) throws NamingException, SQLException;
		
		
	// Read
		// 게시판 전체 글 불러오기
		List<QnaVo> selectAllBoard() throws NamingException, SQLException;
		
		// 전체 글 수 얻어오기
//		int selectCntPost() throws NamingException, SQLException;
		
		// 글번호로 게시물 불러오기
//		내가
		QnaVo selectBoard(int no) throws NamingException, SQLException;
		
	// Update
		// 게시판 조회수 증가
//		void updateReadCnt(int no) throws NamingException, SQLException;
		
}
