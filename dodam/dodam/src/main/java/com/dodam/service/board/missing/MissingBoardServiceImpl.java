package com.dodam.service.board.missing;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.PagingInfoDTO;
import com.dodam.persistence.board.missing.MissingBoardDAO;

@Service
public class MissingBoardServiceImpl implements MissingBoardService{

	@Inject
	private MissingBoardDAO dao;

	@Override
	public Map<String, Object> selectMissingBoardList(int pageNo) throws NamingException, SQLException {
		 PagingInfoDTO pi = pagingProcess(pageNo);
		 List<MissingBoardListDTO> lst = dao.selectMissingBoardList(pi);
		 for(MissingBoardListDTO ld : lst) {
			 if(ld.getImg().length() > 1) {
				 ld.setImg(ld.getImg().split(",")[0]);
			 }
			 
			 if (ld.getGender().equals("M")) {
				 ld.setGender("수컷");
			 } else if (ld.getGender().equals("F")) {
				 ld.setGender("암컷");
			 } else {
				 ld.setGender("성별모름");
			 }
		 }
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("listMissingBoard", lst);
		 map.put("pagingInfo", pi);
		 
		 return map;
	}

	@Override
	public MissingBoardVo getMissingBoard(int no) {
		return dao.getMissingBoard(no);
	}

	@Override
	public boolean insertBoard(MissingWriteDTO mw) {
		boolean result = false;
		if (dao.insertBoard(mw)==1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteBoard(int no) {
		boolean result = false;
		if (dao.deleteBoard(no)==1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateBoard(MissingWriteDTO mw) {
		boolean result = false;
		if (dao.updateBoard(mw)==1) {
			result = true;
		}
		
		return result;
	}
	
	// 페이징을 위한 처리 작업 전담 메서드
	private PagingInfoDTO pagingProcess(int pageNo) throws NamingException, SQLException {
		PagingInfoDTO pi = new PagingInfoDTO();
		
		pi.setPostPerPage(20);
		pi.setPageCntPerBlock(10);
		
		pi.setStartNum(pageNo); // 출력 시작할 번호
		int totalPost = 0;
		totalPost = dao.selectCntPost(); // 전체 글 수를 얻음
		pi.setTotalPage(totalPost); // 전체 페이지 수
		pi.setCurrentPagingBlock(pageNo); // 현재 페이지가 속한 블록
		
		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock()); // 시작 페이지 블록
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock()); // 끝 페이지 블록
		pi.setTotalPagingBlockCnt(pi.getTotalPage()); // 페이지 블록의 개수
		
		System.out.println(pi.toString());
		
		return pi;
	}
}
