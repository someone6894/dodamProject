package com.dodam.service.reply.proud;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.ReplyVo;

public interface ReplyService {
	// 전체 댓글 읽어오기
			public List<ReplyVo> ListReply(int bno) throws Exception;

	// 포인트 적립
			boolean addpoint(MypointVo vo) throws NamingException, SQLException;

	// 댓글 달기
			public boolean addReply(ReplyVo vo) throws Exception;

	// 대댓글 달기
			public boolean reReply(ReplyVo vo, int result2) throws Exception;

	// 댓글 수정 
			public boolean updateReply(ReplyVo vo) throws Exception;
			
	// 댓글 삭제
			public boolean deleteReply(ReplyVo vo) throws Exception;

			public int replycount(ReplyVo vo) throws Exception;
			
}
