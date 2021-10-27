package com.dodam.persistence.reply.proud;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.ReplyVo;

public interface ReplyDAO {
	// 전체 댓글 읽어오기
		public List<ReplyVo> read(int bno) throws Exception;

	// 포인트 적립
		int addpoint(MypointVo vo) throws NamingException, SQLException;
		
	// 댓글 달기
		public int create(ReplyVo vo) throws Exception;

	// 대댓글 달기
		public int append(ReplyVo vo) throws Exception;
			
	// 댓글 수정
		public int update(ReplyVo vo) throws Exception;

	// 댓글 삭제
		public int delete(ReplyVo vo) throws Exception;

		public int replycount(ReplyVo vo) throws Exception;

		public int maxreplyno() throws Exception;
}
