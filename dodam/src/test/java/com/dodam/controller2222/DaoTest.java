package com.dodam.controller2222;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.inject.Inject;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dodam.domain.proud.ProudVo;
import com.dodam.persistence.board.proud.ProudDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DaoTest {

	@Inject
	private DataSource dataSource;

	@Test
	public void testConnection() throws ClassNotFoundException, SQLException {
		
		
			Connection con = dataSource.getConnection();
			
			if (con != null) {
				System.out.println("con someone09.cafe24 DB접속 성공 : " + con);
		}
	}
	
	
//	@Test
//	public void ReadTest() throws NamingException, SQLException {
//		
//		int no = 39;
//		
//		ProudVo proudInfo = dao.selectBoard(no);
//		
//		System.out.println(proudInfo.toString());
//	}
//	

	@Inject
	private ProudDAO dao;
	
	@Test
	public void InsertTest() throws NamingException, SQLException {
		
		int proudInfo = dao.insertBoardVo(new ProudVo(0,"제목1","bbb","내용2",null,
				0,0,"images/dooly.png",null,null));
		
		System.out.println(proudInfo);
	}
}
