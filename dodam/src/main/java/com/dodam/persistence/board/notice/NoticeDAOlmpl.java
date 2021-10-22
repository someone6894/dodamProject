package com.dodam.persistence.board.notice;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.notice.NoticeVo;

@Repository
public class NoticeDAOlmpl implements NoticeDAO {

	private static String namespace = "com.dodam.mapper.noticeMapper";
	
	@Inject
	private SqlSession ses;
	
	@Override
	public List<NoticeVo> selectnoticeall() throws NamingException, SQLException {
		return ses.selectList(namespace+ ".selectnoticeall");
	}

	@Override
	public int insertNotice(NoticeVo nvo) throws NamingException, SQLException {
		return ses.insert(namespace+ ".insertNotice", nvo);
	}

	@Override
	public NoticeVo selectnotice(int no) throws NamingException, SQLException {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".selectnotice", no);
	}

	@Override
	public void updatenotice(NoticeVo vo) throws NamingException, SQLException {
	ses.update(namespace+".updatenotice", vo);
	}

	@Override
	public void delnotice(int no) throws NamingException, SQLException {
		ses.delete(namespace+ ".delnotice", no);
	}

	@Override
	public int selectCntPost() {
		// TODO Auto-generated method stub
		return Integer.parseInt(ses.selectOne(namespace + ".getTotalPostCnt"));
	}
	

	
}
