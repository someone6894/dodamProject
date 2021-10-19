package com.dodam.service.board.notice;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.notice.NoticeVo;

public interface NoticeService {


	NoticeVo addnotice();
	
	//전체글 불러오기
	Map<String, Object> readAllBoard(int pageNo) throws NamingException, SQLException;;

}
