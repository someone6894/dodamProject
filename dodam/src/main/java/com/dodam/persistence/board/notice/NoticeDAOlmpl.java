package com.dodam.persistence.board.notice;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.notice.NoticeVo;
import com.dodam.domain.notice.PagingInfoDTO;

@Repository
public class NoticeDAOlmpl implements NoticeDAO {

	private static String namespace = "com.dodam.mapper.noticeMapper";
	
	@Inject
	private SqlSession ses;
	
	// 전체 글 출력
	@Override
	public List<NoticeVo> selectnoticeall(int pageNo, PagingInfoDTO pi)throws NamingException, SQLException {
		return ses.selectList(namespace+ ".selectnoticeall",pi);
	}

	// 글쓰기 
	@Override
	public int insertNotice(NoticeVo nvo) throws NamingException, SQLException {
		return ses.insert(namespace+ ".insertNotice", nvo);
	}

	// 상세글 출력
	@Override
	public NoticeVo selectnotice(int no) throws NamingException, SQLException {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".selectnotice", no);
	}

	@Override
	public int updatenotice(NoticeVo vo) throws NamingException, SQLException {
		return ses.update(namespace+".updatenotice", vo);
	}

	@Override
	public int delnotice(int no) throws NamingException, SQLException {
		return ses.delete(namespace+ ".delnotice", no);
	}

	@Override
	public int selectCntPost() {
		// TODO Auto-generated method stub
		return Integer.parseInt(ses.selectOne(namespace + ".getTotalPostCnt"));
	}
	

	
}
