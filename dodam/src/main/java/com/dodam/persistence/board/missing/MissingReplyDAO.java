package com.dodam.persistence.board.missing;

import java.util.List;

import com.dodam.domain.missing.MissingReplyVo;

public interface MissingReplyDAO {

	int insertReply(MissingReplyVo mrv);

	List<MissingReplyVo> selectAllReply(int pno);

	int deleteReply(int no);

	int updateReply(MissingReplyVo mrv);

	int selectNo();

	MissingReplyVo selectReply(int pid);

	
	// 계층형 댓글을 위한 메서드
	int insertReReply(MissingReplyVo mrv);

	// 부모글 번호를 보고 그 글에 달린 댓글을 삭제하는 메서드
	int deleteReplyBypno(int pno);

}
