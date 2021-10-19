package com.dodam.persistence.board.notice;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.notice.NoticeVo;



public interface NoticeDAO {
	// 공지사항 리스트 전체 가져오기
	List<NoticeVo> selectAllBoard() throws NamingException, SQLException;

	// 공지사항 게시판에 글쓰기
	int insertNoticeVo(NoticeVo nvo) throws NamingException, SQLException;
}
