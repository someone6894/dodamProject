package com.dodam.service.board.event;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.event.EventBoardVO;

public interface EventBoardService {
		
		//게시물 목록
		public List<EventBoardVO> list() throws NamingException, SQLException;	
		
		//게시물 작성
		public void write(EventBoardVO vo) throws NamingException, SQLException;
		
		//게시물 조회
		public EventBoardVO view(int no) throws NamingException, SQLException;
		
		//게시물 수정
		public void modify (EventBoardVO vo) throws NamingException, SQLException;
		
		//게시물 삭제
		public void delete (int no) throws NamingException, SQLException;
		
		//게시물 갯수 조회
		public int count() throws NamingException, SQLException;
		
		//게시물 목록 + 페이징
		public List listPage(int displayPost, int postNum) throws NamingException, SQLException;
	}
