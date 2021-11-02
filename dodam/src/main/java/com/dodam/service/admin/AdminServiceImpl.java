package com.dodam.service.admin;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.mariadb.jdbc.internal.com.read.ReadInitialHandShakePacket;
import org.springframework.stereotype.Service;

import com.dodam.domain.admin.Comments;
import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;
import com.dodam.persistence.admin.AdminDAO;
import com.dodam.persistence.board.missing.MissingBoardDAO;
import com.dodam.persistence.members.MemberDao;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	@Inject
	private MemberDao memdao;
	
	@Inject
	private MissingBoardDAO missdao;

	@Override
	public Map<String, Object> selectAllMembers(int pageNo) throws Exception {
		PagingInfoDTO pi = pagingProcess(pageNo, "");
		Map<String, Object> map = new HashMap<String, Object>();
		int totalPost = dao.selectCntUser("");
		map.put("memList", dao.selectAllMembers(pi));
		map.put("pagingInfo", pi);
		map.put("totalPost", totalPost);
		return map;
	}
	
	private PagingInfoDTO pagingProcess(int pageNo, String searchId) throws Exception {
		PagingInfoDTO pi = new PagingInfoDTO();
		
		pi.setPostPerPage(10);
		pi.setPageCntPerBlock(10);
		
		pi.setStartNum(pageNo); // 출력 시작할 번호
		int totalPost = 0;
		totalPost = dao.selectCntUser(searchId); // 전체 회원 수를 얻음
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

	@Override
	public boolean infoupdate(MemberVo member) throws NamingException, SQLException {
		boolean result = false;
		
		int result_int = memdao.infoupdate(member);
		
		if (result_int == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean pwdCheck(String userid, String password) {
		boolean result = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("password", password);
		
		if (memdao.pwdCheck(map) != null) {
			result = true;
		}
		return result;
	}

	@Override
	public List<Comments> getMissingComments() {
		return dao.getMissingCommnets();
	}

	@Override
	public int cntMissingComment() {
		return dao.cntMissingComment();
	}

	@Override
	public boolean changePwd(String userid, String password) throws NamingException, SQLException {
		boolean result = false;
		MemberVo mem = new MemberVo();
		mem.setUserid(userid);
		mem.setPassword(password);
		if (memdao.passwordupdate(mem) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteUser(String userid) throws NamingException, SQLException {
		boolean result = false;
		MemberVo mem = new MemberVo();
		mem.setUserid(userid);
		if (memdao.deleteAccount(mem) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public Map<String, Object> searchMembers(int pageNo, String searchId) throws Exception {
		PagingInfoDTO pi = pagingProcess(pageNo, searchId);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchId", searchId);
		param.put("startNum", pi.getStartNum());
		param.put("postPerPage", pi.getPostPerPage());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagingInfo", pi);
		map.put("searchResult", dao.searchMembers(param));
		
		return map;
	}
}
