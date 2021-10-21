package com.dodam.service.reply.proud;

import java.util.List;

import com.dodam.domain.proud.ReplyVo;

public interface ReplyService {
	// 전체 댓글 읽어오기
			public List<ReplyVo> ListReply(int bno) throws Exception;
			
	// 댓글 달기
			public boolean addReply(ReplyVo vo) throws Exception;

	// 대댓글 달기
			public boolean reReply(ReplyVo vo) throws Exception;

	// 댓글 수정 
			public boolean updateReply(ReplyVo vo) throws Exception;
			
	// 댓글 삭제
			public boolean deleteReply(ReplyVo vo) throws Exception;
			
}
