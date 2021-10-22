package com.dodam.persistence.board.qna;

import java.util.List;

import com.dodam.domain.qna.QnaReplyVo;

public interface QnaReplyDAO {
	// 전체 댓글 읽어오기
	public List<QnaReplyVo> read(int bno) throws Exception;
	
	// 댓글 달기
	public int create(QnaReplyVo vo) throws Exception;
	
	// 댓글 수정
	public int update(QnaReplyVo vo) throws Exception;
	
	// 댓글 삭제
	public int delete(int no) throws Exception;
}
