package com.dodam.persistence.board.notice;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.springframework.stereotype.Repository;

import com.dodam.domain.notice.NoticeVo;

@Repository
public class NoticeDAOlmpl implements NoticeDAO {

	@Override
	public List<NoticeVo> selectAllBoard() throws NamingException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
