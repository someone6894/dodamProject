package com.dodam.service.admin;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;
import com.dodam.persistence.admin.AdminDAO;
import com.dodam.persistence.members.MemberDao;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	@Inject
	private MemberDao memdao;

	@Override
	public Map<String, Object> selectAllMembers(int pageNo) throws Exception {
		PagingInfoDTO pi = pagingProcess(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		int totalPost = dao.selectCntPost();
		map.put("memList", dao.selectAllMembers(pi));
		map.put("pagingInfo", pi);
		map.put("totalPost", totalPost);
		return map;
	}
	
	private PagingInfoDTO pagingProcess(int pageNo) throws Exception {
		PagingInfoDTO pi = new PagingInfoDTO();
		
		pi.setPostPerPage(10);
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

	@Override
	public MemberVo getMemberInfo(String userid) {
		return memdao.checkDupliactedId(userid);
	}

	@Override
	public String getMemberGrade(MemberVo mem) throws NamingException, SQLException {
		return memdao.grade(memdao.sumpoint(mem.getUserid()));
	}
}
