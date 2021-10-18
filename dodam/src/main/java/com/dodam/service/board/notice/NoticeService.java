package com.dodam.service.board.notice;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.notice.NoticeVo;

public interface NoticeService {

	Map<String, Object> readAllBoard() throws NamingException, SQLException;

	NoticeVo addnotice();

}
