package com.dodam.service.board.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.notice.NoticeVo;
import com.dodam.domain.notice.PagingInfoDTO;
import com.dodam.persistence.board.notice.NoticeDAO;


@Service
public class NoticeServicelmpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	//공지 등록
	@Override
	public boolean insertNotice(NoticeVo nvo) throws NamingException, SQLException {
		boolean insertNotice = false;

		return insertNotice;
	}
	
	// 공지 전체 띄우기
	@Override
	public 	Map<String, Object> selectnoticeall(int pageNo) throws NamingException, SQLException {
		PagingInfoDTO pi = pagingProcess(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", dao.selectnoticeall());
		map.put("pagingInfo", pi);
		return map;
	} 
	
	// 페이징을 위한 처리 작업 전담 메서드
		private PagingInfoDTO pagingProcess(int pageNo) throws NamingException, SQLException {
			PagingInfoDTO pi = new PagingInfoDTO();

			pi.setStartNum(pageNo); // 출력 시작할 번호
			int totalPost = 0;

			totalPost = dao.selectCntPost(); // 전체 글 수를 얻음

			pi.setTotalPage(totalPost); // 전체 페이지 수
			pi.setCurrentPagingBlock(pageNo); // 현재 페이지블록

			pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock());  // 시작 페이지 블록
			pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock());   // 끝 페이지 블록
			pi.setTotalPagingBlockCnt(pi.getTotalPage()); // 페이지 블록 갯수

			
			return pi;
		}


	// 공지 자세히 보기
	@Override
	public NoticeVo selectnotice(int no) throws NamingException, SQLException {
		// TODO Auto-generated method stub
		return dao.selectnotice(no);
	}
	
	//공지 업데이트
	@Override
	public void updatenotice(NoticeVo vo) throws NamingException, SQLException {
		// TODO Auto-generated method stub
		dao.updatenotice(vo);
	}

	// 공지삭제
	@Override
	public void delnotice(int no) throws NamingException, SQLException {
		// TODO Auto-generated method stub
		dao.delnotice(no);
	}

	

}
