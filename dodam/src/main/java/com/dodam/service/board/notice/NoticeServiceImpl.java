package com.dodam.service.board.notice;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeServiceImpl {
	
	private static String namespace = "com.dodam.mapper.noticeMapper";
	
	@Inject
	private SqlSession ses;
	
	
}
