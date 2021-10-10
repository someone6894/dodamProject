package com.dodam.persistence.board.qna;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.qna.QnaVo;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static String namespace = "com.dodam.mapper.boardMapper";

	@Inject
	private SqlSession ses;

	@Override
	public List<QnaVo> selectAllBoard() throws NamingException, SQLException {
		List<QnaVo> lst = null;
		lst = ses.selectList(namespace + ".selectAllBoard");

		return lst;
	}
	
//	내가한거
	@Override
	public int insertBoardVo(QnaVo vo) throws NamingException, SQLException {
		return ses.insert(namespace + ".createBoard", vo);
	}

	@Override
	public QnaVo selectBoard(int no) throws NamingException, SQLException {
		return ses.selectOne(namespace + ".selectBoard", no);
	}
}
