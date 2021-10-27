package com.dodam.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dodam.domain.members.MemberVo;
import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.persistence.admin.AdminDAO;
import com.dodam.persistence.board.adopt.AdoptBoardDAO;
import com.dodam.persistence.board.missing.MissingBoardDAO;
import com.dodam.persistence.board.proud.ProudDAO;
import com.dodam.persistence.board.qna.QnaBoardDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Inject
	private MissingBoardDAO missingdao;
	
	@Inject
	private AdoptBoardDAO adoptdao;
	
	@Inject
	private ProudDAO prouddao;
	
	@Inject
	private QnaBoardDAO qnadao;
	
	@Override
	public Map<String, Object> selectAllMembers(int pageNo) throws Exception {
		PagingInfoDTO pi = pagingProcess(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList",dao.selectAllMembers(pi));
		map.put("pagingInfo", pi);
		
		return map;
	}

	@Override
	public MemberVo getUserInfo(String userid) {
		MemberVo member = dao.selectUserInfo(userid);
		return member;
	}
	
	// 회원 페이징을 위한 처리 작업 전담 메서드
	private PagingInfoDTO pagingProcess(int pageNo) throws Exception {
		PagingInfoDTO pi = new PagingInfoDTO();
		
		pi.setPostPerPage(8);
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
	
	// 게시판 게시글 페이징 처리를 위해 오버로딩된 메서드
	private PagingInfoDTO pagingProcess(int pageNo, String boardName) throws Exception {
		PagingInfoDTO pi = new PagingInfoDTO();
		
		pi.setPostPerPage(8);
		pi.setPageCntPerBlock(10);
		
		pi.setStartNum(pageNo); // 출력 시작할 번호
		// 전체 글 수를 얻어옴
		int totalPost = 0;
		if (boardName.equals("missingboard")) {
			totalPost = dao.selectMissingCntPost();
		} else if (boardName.equals("adoptboarduser")) {
			totalPost = dao.selectAdoptCntPost();
		} else if (boardName.equals("proudboard")) {
			totalPost = dao.selectProudCntPost();
		} else if (boardName.equals("qna")) {
			totalPost = dao.selectQNACntPost();
		}
		pi.setTotalPage(totalPost); // 전체 페이지 수
		
		pi.setCurrentPagingBlock(pageNo); // 현재 페이지가 속한 블록
		
		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock()); // 시작 페이지 블록
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock()); // 끝 페이지 블록
		pi.setTotalPagingBlockCnt(pi.getTotalPage()); // 페이지 블록의 개수
		
		System.out.println(pi.toString());
		
		return pi;
	}

	@Override
	public Map<String, Object> getBoardList(String userid, int pageNo, String boardName) throws Exception {
		PagingInfoDTO pi = pagingProcess(pageNo, boardName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", pi.getStartNum());
		map.put("postPerPage", pi.getPostPerPage());
		map.put("userid", userid);
		
		@SuppressWarnings("rawtypes")
		List lst = new ArrayList();
		if (boardName.equals("missingboard")) {
			lst = dao.selectMissingBoard(map);
		} else if (boardName.equals("adoptboarduser")) {
			lst = dao.selectAdoptBoard(map);
		} else if (boardName.equals("proudboard")) {
			lst = dao.selectProudBoard(map);
		} else if (boardName.equals("qna")) {
			lst = dao.selectQNABoard(map);
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("boardList", lst);
		returnMap.put("pagingInfo", pi);
		
		return returnMap;
	}



}
