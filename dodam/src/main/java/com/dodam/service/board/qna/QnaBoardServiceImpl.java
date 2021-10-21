package com.dodam.service.board.qna;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.qna.PagingQna;
import com.dodam.domain.qna.QnaVo;
import com.dodam.persistence.board.qna.QnaBoardDAO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	@Inject
	private QnaBoardDAO dao;


	@Override
	public Map<String, Object> readAllBoard(int pageNo) throws NamingException, SQLException {
		PagingQna pi = pagingProcess(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", dao.selectAllBoard(pageNo, pi));
		map.put("pagingInfo", pi);
		return map;
	}

	private PagingQna pagingProcess(int pageNo) throws NamingException, SQLException {
		 PagingQna pi = new PagingQna();
	      
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
	
//내가
	@Override
	public boolean addBoard(QnaVo vo) throws NamingException, SQLException {
		boolean addBoard = false;
		
		// 타이틀에 태그 실행 방지
		
		vo.setTitle(vo.getTitle().replace("<", "&lt;"));
		vo.setTitle(vo.getTitle().replace(">", "&gt;"));
		
		vo.setContents(vo.getContents().replace("\n", "<br />")); // 줄바꿈
				
		
		int result = dao.insertBoardVo(vo);
//		int result2 = 0;
//		if (result == 1) { // 글쓰기 정상
//			result2 = dao.insertMemberPoint(new MemberPointVo(bo.getWriter(), null, 2, "글작성"));
//		}
//
//		if (result == 1 && result2 == 1) {
//			addBoard = true;
//		}

		return addBoard;
	}


	@Override
	public QnaVo readBoard(int no) throws NamingException, SQLException {
		QnaVo vo = dao.selectBoard(no);
		
		return vo;
	}
	
	@Override
	public int deleteBoard(int no) throws NamingException, SQLException {
		return dao.deleteBoard(no);
		
		
	}

	@Override
	public int updateBoard(QnaVo vo) throws NamingException, SQLException {
		return dao.updateBoard(vo);
	}

	

//	@Transactional(isolation = Isolation.READ_COMMITTED) // 조회수 update문이 commit된 데이터에 한해 select되도록 격리 레벨을 올림
//	@Override
//	public BoardVo readBoard(int no) throws NamingException, SQLException {
//		// 하루에 한번인지 체크 (ip주소를 가지고) - jsp miniProj 참고
//		dao.updateReadCnt(no); // 조회수 증가
//		BoardVo vo = dao.selectBoard(no);
//		
//		return vo;
//	}

}
