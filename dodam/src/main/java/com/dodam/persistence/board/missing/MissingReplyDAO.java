package com.dodam.persistence.board.missing;

import java.util.List;

import com.dodam.domain.missing.MissingReplyVo;

public interface MissingReplyDAO {

	int insertReply(MissingReplyVo mrv);

	List<MissingReplyVo> selectAllReply(int pno);

	int deleteReply(int no);

}
