package com.dodam.service.board.adopt;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.adopt.PagingInfoDTO;
import com.dodam.persistence.board.adopt.AdoptBoardDAO;

@Service
public class AdoptBoardServiceImpl implements AdoptBoardService {

	@Inject
	private AdoptBoardDAO dao;

	// adoptboarduser 게시글 등록
	@Override
	public boolean addBoard(AdoptVo bo) throws NamingException, SQLException {
		boolean addBoard = false;

		// 타이틀에 태그 실행 방지

		bo.setTitle(bo.getTitle().replace("<", "&lt;"));
		bo.setTitle(bo.getTitle().replace(">", "&gt;"));
		bo.setContents(bo.getContents().replace("\n", "<br />")); // 줄바꿈

		int result = dao.insertBoardVo(bo);

		if (result == 1) {
			addBoard = true;
		}

		// 멤버 포인트 주기
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

	// adoptboarduser 전체 게시글 출력
	@Override
	public Map<String, Object> readAllAdopt(int pageNo) throws NamingException, SQLException {
		PagingInfoDTO pi = pagingProcess(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", dao.selectAllAdopt(pageNo, pi));
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

			pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock()); // 시작 페이지 블록
			pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock()); // 끝 페이지 블록
			pi.setTotalPagingBlockCnt(pi.getTotalPage()); // 페이지 블록 갯수

			return pi;
		}

		
	
	// adoptboarduser 상세페이지 보기
	@Transactional(isolation = Isolation.READ_COMMITTED) // 조회수 update문이 commit된 데이터에 한해 select되도록 격리 레벨을 올림
	@Override
	public AdoptVo readBoard(int no) throws NamingException, SQLException {
		int tmp = 0;
		tmp = dao.updateReadCnt(no);// 조회수 증가
		if (tmp == 1) {
			System.out.println("조회수 증가됨");
		}
		AdoptVo vo = dao.selectBoard(no);

		return vo;
	}

	// adoptboarduser 게시글 삭제
	@Override
	public void removeBoard(int no) throws NamingException, SQLException {
		dao.deleteBoard(no);

	}

	// adoptboarduser 게시글 수정
	@Override
	public boolean updateBoard(AdoptVo bo) throws NamingException, SQLException {
		boolean updateBoard = false;

		// 타이틀에 태그 실행 방지

		bo.setTitle(bo.getTitle().replace("<", "&lt;"));
		bo.setTitle(bo.getTitle().replace(">", "&gt;"));
		bo.setContents(bo.getContents().replace("\n", "<br />")); // 줄바꿈

		int result = dao.updateBoard(bo);

		if (result == 1) {
			updateBoard = true;
		}

		return updateBoard;
	}

	
	
	
	
//	// adoptboardPublic show list all
//	public Map<String, Object> readAllAdoptPublic() throws NamingException, SQLException {
////		PagingInfoDTO pi = pagingProcess(pageNo, sc);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("boardList", dao.selectAllAdoptPublic());
////		map.put("pagingInfo", pi);
//		return map;
//	}

}
