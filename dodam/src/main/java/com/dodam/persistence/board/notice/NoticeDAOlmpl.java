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
	public List<NoticeVo> selectAllBoard() throws NamingException, SQLException {
		List<NoticeVo> lst = null;
		
		return null;
	}

	@Override
	public int insertNoticeVo(NoticeVo nvo) throws NamingException, SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
