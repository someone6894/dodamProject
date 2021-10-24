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

	int updateRef(MissingReplyVo mrv);

	int insertReReply(MissingReplyVo mrv);


}
