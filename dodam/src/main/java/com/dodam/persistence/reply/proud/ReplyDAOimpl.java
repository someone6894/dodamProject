package com.dodam.persistence.reply.proud;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.proud.ReplyVo;

@Repository
public class ReplyDAOimpl implements ReplyDAO {

	private static String ns = "com.dodam.mapper.proudReplyMapper";

	@Inject
	private SqlSession ses;
	
	@Override
	public List<ReplyVo> read(int bno) throws Exception {
		return ses.selectList(ns + ".replyList", bno);
	}

	@Override
	public int create(ReplyVo vo) throws Exception {
		return ses.insert(ns + ".create", vo);
	}

}
