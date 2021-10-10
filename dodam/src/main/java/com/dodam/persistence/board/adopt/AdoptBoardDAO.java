package com.dodam.persistence.board.adopt;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.adopt.PagingInfoDTO;

public interface AdoptBoardDAO {

	// Create
	// adoptboardUser 게시판 글 저장 하기
	int insertBoardVo(AdoptVo bo) throws NamingException, SQLException;

	
	// Read
	// adoptboardUser 게시판 조회수 증가
	int updateReadCnt(int no) throws NamingException, SQLException;

	// adoptboardUser 전체 게시글 조회
	List<AdoptVo> selectAllAdopt(int pageNo, PagingInfoDTO pi) throws NamingException, SQLException;

	// adoptboardUser 전체 글 수 얻어오기
	int selectCntPost() throws NamingException, SQLException;

	// adoptboardUser 상세페이지 조회
	AdoptVo selectBoard(int no) throws NamingException, SQLException;
	
	
	// Update
	// adoptboardUser 게시글 수정
	int updateBoard(AdoptVo bo) throws NamingException, SQLException;

	
	// Delete
	// adoptboardUser 게시글 삭제 
	void deleteBoard(int no) throws NamingException, SQLException;

	
	
//	// adoptboardPublic show list all
//	public List<AdoptVo> selectAllAdoptPublic() throws NamingException, SQLException;

}
