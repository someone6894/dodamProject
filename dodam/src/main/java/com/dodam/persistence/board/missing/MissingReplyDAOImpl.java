package com.dodam.persistence.board.missing;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.missing.MissingReplyVo;

@Repository
public class MissingReplyDAOImpl implements MissingReplyDAO {
	
	private String ns = "com.dodam.mappers.MissingReplyMapper";
	
	@Inject
	private SqlSession ses;

	@Override
	public int insertReply(MissingReplyVo mrv) {
		return ses.insert(ns + ".insertReply", mrv);
	}

	@Override
	public List<MissingReplyVo> selectAllReply(int pno) {
		return ses.selectList(ns + ".selectAllReply", pno);
	}

	@Override
	public int deleteReply(int no) {
		return ses.delete(ns + ".deleteReply", no);
	}

	@Override
	public int updateReply(MissingReplyVo mrv) {
		return ses.update(ns + ".updateReply", mrv);
	}

	@Override
	public int selectNo() {
		return ses.selectOne(ns + ".selectNo");
	}

	@Override
	public MissingReplyVo selectReply(int pid) {
		return ses.selectOne(ns + ".selectReply", pid);
	}

	@Override
	public int updateRef(MissingReplyVo mrv) {
		return ses.update(ns + ".updateRef", mrv);
	}

	@Override
	public int insertReReply(MissingReplyVo mrv) {
		return ses.insert(ns + ".insertReReply", mrv);
	}

	@Override
	public int updateRollbackRef(MissingReplyVo mrv) {
		return ses.update(ns + ".updateRollbakcRef", mrv);
	}


}
