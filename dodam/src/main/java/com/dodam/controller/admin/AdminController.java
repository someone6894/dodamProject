package com.dodam.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;
import com.dodam.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;
	
	@RequestMapping("")
	public String callAdminPage() {
		return "/admin/adminPage";
	}
	
	@RequestMapping("/members")
	public void members(Model model, @RequestParam(value="pageNo", defaultValue = "1") int pageNo) {
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
	}
	
	@RequestMapping("/board")
	public void board() {
	}
	
	@RequestMapping("/reply")
	public void reply() {
	}
	
	@RequestMapping("/userinfo")
	public void userinfo(@RequestParam(value="userid") String userid,
						@RequestParam(value="pageNo", defaultValue = "1") int pageNo,
						@RequestParam(value="boardName", defaultValue="missingboard") String boardName,
						Model model) {
		
		// 사용자 정보 조회
		MemberVo userInfo = service.getUserInfo(userid);
		
		// 게시판 별 사용자 작성글 조회
		Map<String, Object> map = null;
		try {
			map = service.getBoardList(userid, pageNo, boardName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List boardList = new ArrayList();
		if (map.get("boardList") != null) {
			boardList = (List)map.get("boardList");
		}

		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingInfo", pi);
		model.addAttribute("boardName", boardName);
		
	}
}