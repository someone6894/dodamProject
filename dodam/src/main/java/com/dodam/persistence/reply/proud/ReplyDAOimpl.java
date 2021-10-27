package com.dodam.persistence.reply.proud;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.members.MypointVo;
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

	@Override
	public int update(ReplyVo vo) throws Exception {
		return ses.update(ns + ".update", vo);
	}

	@Override
	public int delete(ReplyVo vo) throws Exception {
		return ses.delete(ns + ".delete", vo);
	}

	@Override
	public int append(ReplyVo vo) throws Exception {
		System.out.println("다오단 확인 " + vo.toString());
		return ses.insert(ns + ".append", vo);
	}
	
	@Override
	public int addpoint(MypointVo vo) throws NamingException, SQLException {
		return ses.insert(ns + ".addpoint", vo);
	}

	@Override
	public int replycount(ReplyVo vo) throws Exception {
		return ses.selectOne(ns + ".replycount", vo);
	}

	@Override
	public int maxreplyno() throws Exception {
		return ses.selectOne(ns + ".maxreplyno");
	}

}
