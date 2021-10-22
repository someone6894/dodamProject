package com.dodam.persistence.board.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.qna.QnaReplyVo;


@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO {

	private static String ns = "com.dodam.mapper.QnaReplyMapper";
	
	@Inject
	private SqlSession ses;
	
	@Override
	public List<QnaReplyVo> read(int bno) throws Exception {
		return ses.selectList(ns + ".replyList", bno);
	}

	@Override
	public int create(QnaReplyVo vo) throws Exception {
		return ses.insert(ns + ".create", vo);
	}

	@Override
	public int update(QnaReplyVo vo) throws Exception {
		return ses.update(ns + ".modify", vo);
	}

	@Override
	public int delete(int no) throws Exception {
		return ses.delete(ns + ".remove", no);
	}

}
