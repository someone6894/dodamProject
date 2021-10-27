package com.dodam.persistence.board.qna;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.qna.PagingQna;
import com.dodam.domain.qna.QnaVo;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	private static String namespace = "com.dodam.mapper.qnaBoardMapper";

	@Inject
	private SqlSession ses;


	@Override
	public List<QnaVo> selectAllBoard(int pageNo, PagingQna pi) throws NamingException, SQLException {
		List<QnaVo> lst = null;
		lst = ses.selectList(namespace + ".selectAllBoard", pi);

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
	

	@Override
	public int deleteBoard(int no) throws NamingException, SQLException {
		return ses.delete(namespace + ".deleteBoard", no);
	}

	@Override
	public int updateBoard(QnaVo vo) throws NamingException, SQLException {
		return ses.update(namespace + ".updateBoard", vo);
	}

	

	@Override
	public int selectCntPost() throws NamingException, SQLException {
		return ses.selectOne(namespace + ".getTotalPostCnt");
	}
	
////	조회수증가
	@Override
	public void updateReadCnt(int no) throws NamingException, SQLException {
		ses.update(namespace + ".increaseReadCnt", no);
	}
	
}
