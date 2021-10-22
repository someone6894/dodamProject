package com.dodam.service.board.notice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.notice.NoticeVo;

public interface NoticeService {

	//C 
		//공지사항 게시판에 글쓰기
		boolean insertNotice(NoticeVo nvo) throws NamingException, SQLException;

	//R 
		//공지사항 리스트 전체 가져오기
		
		Map<String, Object> selectnoticeall(int pageNo) throws NamingException, SQLException;
	
		//공지사항 자세히 보기
		NoticeVo selectnotice(int no) throws NamingException, SQLException;
			
	//U
		//공지사항 수정하기
		void updatenotice(NoticeVo vo) throws NamingException, SQLException;
			
	//D
		//공지사항 삭제하기
		void delnotice(int no) throws NamingException, SQLException;

	

	
}
