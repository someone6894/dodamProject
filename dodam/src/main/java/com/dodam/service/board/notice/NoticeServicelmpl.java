package com.dodam.service.board.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.notice.NoticeVo;
import com.dodam.persistence.board.notice.NoticeDAOlmpl;

@Service
public class NoticeServicelmpl implements NoticeService {

	@Inject
	private NoticeDAOlmpl dao;
	
	@Override
	public NoticeVo addnotice() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Map<String, Object> readAllBoard() throws NamingException, SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", dao.selectAllBoard());
		return map;
	
	}

}
