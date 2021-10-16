package com.dodam.service.board.event;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.event.EventBoardVO;
import com.dodam.persistence.board.event.EventBoardDAO;

@Service
public class EventBoardServiceImpl implements EventBoardService {

	@Inject
	private EventBoardDAO dao;
	
	@Override
	public List<EventBoardVO> list() throws NamingException, SQLException {

		return dao.list();
	}

	@Override
	public void write(EventBoardVO vo) throws NamingException, SQLException {
		
		dao.write(vo);
		
	}

	@Override
	public EventBoardVO view(int no) throws NamingException, SQLException {
	
		return dao.view(no);
	}

	@Override
	public void modify(EventBoardVO vo) throws NamingException, SQLException {
		dao.modify(vo);
		
	}

	@Override
	public void delete(int no) throws NamingException, SQLException {
		
		dao.delete(no);
		
	}

	@Override
	public int count() throws NamingException, SQLException {
		
		return dao.count();
	}

	@Override
	public List listpage(int displayPost, int postNum) throws NamingException, SQLException {
		
		return dao.listPage(displayPost, postNum);
	}

}
