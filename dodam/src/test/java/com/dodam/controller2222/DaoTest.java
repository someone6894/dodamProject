package com.dodam.controller2222;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
}
