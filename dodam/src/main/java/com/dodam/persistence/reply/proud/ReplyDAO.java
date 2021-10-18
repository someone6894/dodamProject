package com.dodam.persistence.reply.proud;

import java.util.List;

import com.dodam.domain.proud.ReplyVo;

public interface ReplyDAO {
	// 전체 댓글 읽어오기
		public List<ReplyVo> read(int bno) throws Exception;
		
	// 댓글 달기
		public int create(ReplyVo vo) throws Exception;
		
}
