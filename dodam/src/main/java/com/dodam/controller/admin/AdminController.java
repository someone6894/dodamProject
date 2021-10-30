package com.dodam.controller.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;
import com.dodam.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;
	
	@RequestMapping("")
	public String members(Model model, @RequestParam(value="pageNo", defaultValue = "1") int pageNo) {
		Map<String, Object> map = null;
		
		try {
			map =service.selectAllMembers(pageNo);
		} catch (Exception e) {
			// 에러페이지 처리
			e.printStackTrace();
		}
		List<MemberVo> memberList = (List<MemberVo>)map.get("memberList");
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingInfo", pi);
		
		return "/admin/adminPage";
	}
	
	@RequestMapping("/board")
	public void board() {
	}
	
	@RequestMapping("/reply")
	public void reply() {
	}
	
	@RequestMapping("/userinfo")
	public void userinfo(@RequestParam(value="userid") String userid,
						@RequestParam(value="pageNo") int pageNo,
						@RequestParam(value="boardName") String boardName,
						Model model) {
		
		// 사용자 정보 조회
		MemberVo userInfo = service.getUserInfo(userid);
		
		// 게시판 별 사용자 작성글 조회
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Integer> countMap = new HashMap<String, Integer>();
		try {
			map = service.getBoardList(userid, pageNo, boardName);
			countMap.put("point", service.getMemberPoint(userid));
			countMap.put("board", service.getMemberBoard(userid));
			countMap.put("reply", service.getMemberReply(userid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List boardList = new ArrayList();
		if (map.get("boardList") != null) {
			boardList = (List)map.get("boardList");
		}
		
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		int boardsize = (Integer)map.get("boardsize");
		
		model.addAttribute("boardsize", boardsize);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingInfo", pi);
		model.addAttribute("boardName", boardName);
		model.addAttribute("countMap", countMap);
	}
	
	@RequestMapping("/pointView")
	public String userPoint(@RequestParam(value="userid") String userid, Model model) {
		List<MypointVo> lst = new ArrayList<MypointVo>();
		try {
			lst = service.pointlist(userid);
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("pointlist", lst); // 게시판 글 데이터
		
		return "member/pointlist";
	}
}