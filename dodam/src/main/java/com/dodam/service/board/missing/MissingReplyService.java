package com.dodam.service.board.missing;

import java.util.List;

import com.dodam.domain.missing.MissingReplyVo;

public interface MissingReplyService {

	boolean insertReply(MissingReplyVo mrv);

	List<MissingReplyVo> selectAllReply(int pno);

}
