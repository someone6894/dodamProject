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

}
