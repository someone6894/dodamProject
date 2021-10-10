package com.dodam.service.board.proud;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.proud.ProudVo;
import com.dodam.persistence.board.proud.ProudDAO;

@Service
public class ProudServiceimpl implements ProudService {
	@Inject
	private ProudDAO dao;
	
	@Override
	public Map<String, Object> readAllBoard(int pageNo) throws NamingException, SQLException {
		PagingProud pi = pagingProcess(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", dao.selectAllBoard(pageNo, pi));
		map.put("pagingInfo", pi);
		return map;
	}

	 private PagingProud pagingProcess(int pageNo) throws NamingException, SQLException {
		 PagingProud pi = new PagingProud();
	      
	      pi.setStartNum(pageNo);  // 출력 시작할 번호
	      int totalPost = 0;
	     
	      totalPost = dao.selectCntPost();
	         pi.setTotalPage(totalPost); // 전체 페이지 수
	         pi.setCurrentPagingBlock(pageNo); // 현재 페이지블록

	         pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock()); // 시작 페이지 블록
	         pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock()); // 끝 페이지 블록
	         pi.setTotalPagingBlockCnt(pi.getTotalPage()); 		// 페이지 블록 갯수
	         
	         System.out.println(pi.toString());
	      return pi;
	   }
	
	@Override
	public ProudVo readBoard(int no) throws NamingException, SQLException {
		// 하루에 한번인지 체크 (ip주소를 가지고) - jsp miniProj 참고
				ProudVo vo = dao.selectBoard(no);

				return vo;
	}

	@Override
	public boolean addBoard(ProudVo bo) throws NamingException, SQLException {
		boolean addBoard = false;
		
		// 타이틀에 태그 실행 방지
        bo.setTitle(bo.getTitle().replace("<", "&lt;"));
        bo.setTitle(bo.getTitle().replace(">", "&gt;"));
        
        bo.setContent(bo.getContent().replace("\n", "<br />"));        
        
		int result = dao.insertBoardVo(bo);
		
		if (result == 1) {
			addBoard = true;
		}
		return addBoard;
	}

	@Override
	public boolean updateBoard(ProudVo bo) throws NamingException, SQLException {
		boolean updateBoard = false;
		
		// 타이틀에 태그 실행 방지
        bo.setTitle(bo.getTitle().replace("<", "&lt;"));
        bo.setTitle(bo.getTitle().replace(">", "&gt;"));
        
        bo.setContent(bo.getContent().replace("\n", "<br />"));        
        
		int result = dao.updateBoardVo(bo);
		
		if (result == 1) {
			updateBoard = true;
		}
		
		return updateBoard;
	}

	@Override
	public boolean deleteBoard(int no) throws NamingException, SQLException {
		boolean deleteBoard = false;
		
		int result = dao.deleteBoardVo(no);
		
		if (result == 1) {
			deleteBoard = true;
		}
		
		return deleteBoard;
	}


}
