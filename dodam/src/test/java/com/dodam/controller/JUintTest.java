package com.dodam.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.service.board.missing.MissingBoardService;

// JUnit클래스 사용하겠다. root-context.xml의 위치 알려주는 어노테이션 사용
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class JUintTest {
	
	// MissingBoardService클래스의 getMissingBoard를 테스트 하기 위해서 서비스객체 주입
	@Inject
	private MissingBoardService service;
	
	// 테스트 할 메서드 부분. Test 어노테이션 사용
	@Test
	public void getMissingBoardTest() throws Exception {
		
		// 4. no가 존재하는 글번호 no 일 때
		int no = 263;
		
		
		MissingBoardVo mbv = service.getMissingBoard(no);
		
		
		System.out.println(mbv.toString());
	}
}
