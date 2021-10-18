package com.dodam.persistence.board.notice;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dodam.domain.notice.NoticeVo;



public interface NoticeDAO {

	List<NoticeVo> selectAllBoard() throws NamingException, SQLException;
}
