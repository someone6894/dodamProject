
package com.dodam.persistence.board.event;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.event.EventBoardVO;

@Repository
public class EventBoardDAOImpl implements EventBoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.dodam.mapper.boardEventMapper";
	
	@Override
	public List<EventBoardVO> list() throws NamingException, SQLException {

		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(EventBoardVO vo) throws NamingException, SQLException {

		sql.insert(namespace + ".write", vo);
		
	}

	@Override
	public EventBoardVO view(int no) throws NamingException, SQLException {
		return sql.selectOne(namespace + ".view", no);
	}

	@Override
	public void modify(EventBoardVO vo) throws NamingException, SQLException {
		sql.update(namespace +".modify",vo);
		
	}

	@Override
	public void delete(int no) throws NamingException, SQLException {
		 sql.delete(namespace + ".delete", no);
		
	}

	@Override
	public int count() throws NamingException, SQLException {
	
		return sql.selectOne(namespace, ".count");
	}

	@Override
	public List<EventBoardVO> listPage(int displayPost, int postNum) throws NamingException, SQLException {
		
		//두개 이상의 데이터를 다룰땐 value object를 사용하거나 HashMap을 사용 , 난 후자 
		HashMap<String, Integer> data= new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}



}
