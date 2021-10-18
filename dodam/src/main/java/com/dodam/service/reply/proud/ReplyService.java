package com.dodam.service.reply.proud;

import java.util.List;

import com.dodam.domain.proud.ReplyVo;

public interface ReplyService {
	// 전체 댓글 읽어오기
			public List<ReplyVo> ListReply(int bno) throws Exception;
			
	// 댓글 달기
			public boolean addReply(ReplyVo vo) throws Exception;
			
}
