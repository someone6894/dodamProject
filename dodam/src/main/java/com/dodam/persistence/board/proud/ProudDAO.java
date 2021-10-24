package com.dodam.persistence.board.proud;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.proud.ProudVo;

public interface ProudDAO {
	//  Create
	// 게시판에 글 저장하기
	int insertBoardVo(ProudVo bo) throws NamingException, SQLException;
	
	// 포인트 적립
	int addpoint(MypointVo vo) throws NamingException, SQLException;

	
	//  READ
	// 전체 게시판 조회
	List<ProudVo> selectAllBoard(int pageNo, PagingProud pi) throws NamingException, SQLException;

	// 상세페이지 조회
	ProudVo selectBoard(int no) throws NamingException, SQLException;

	// 전체글수 얻어오기
	int selectCntPost() throws NamingException, SQLException;
	
	
	//  UPDATE
	// 게시판 수정하기
	int updateBoardVo(ProudVo bo) throws NamingException, SQLException;
	
	
	//  DELETE
	// 게시판 삭제하기
	int deleteBoardVo(int no) throws NamingException, SQLException;

	// 제목 + 내용 검색
	List<ProudVo> selectTitleBoard(int pageNo, PagingProud pi, String word) throws NamingException, SQLException;

	// 작성자 검색
	List<ProudVo> selectWriterBoard(int pageNo, PagingProud pi, String word) throws NamingException, SQLException;

	// 댓글 검색
	List<ProudVo> selectReplyBoard(int pageNo, PagingProud pi, String word)  throws NamingException, SQLException;
}
