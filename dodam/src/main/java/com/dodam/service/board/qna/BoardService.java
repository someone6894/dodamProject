package com.dodam.service.board.qna;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.qna.QnaVo;



public interface BoardService {
	// Create
			// 게시판에 글 저장 하기
//	내가
			boolean addBoard(QnaVo vo) throws NamingException, SQLException;
			
			
			
		// Read
			// 게시판의 전체글 불러오기
			Map<String, Object> readAllBoard() throws NamingException, SQLException;
			
			// 게시판 상세정보보기 번호로
//			내가
			QnaVo readBoard(int no) throws NamingException, SQLException;
}
