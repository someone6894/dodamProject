package com.dodam.service.board.qna;

import java.util.List;

import com.dodam.domain.qna.QnaReplyVo;



public interface QnaReplyService {
	// 전체 댓글 읽어오기
	public List<QnaReplyVo> listReply(int bno) throws Exception;

	// 댓글 달기
	public boolean addReply(QnaReplyVo vo) throws Exception;

	// 댓글 수정
	public boolean modifyReply(QnaReplyVo vo) throws Exception;

	// 댓글 삭제
	public boolean removeReply(int no) throws Exception;
}
