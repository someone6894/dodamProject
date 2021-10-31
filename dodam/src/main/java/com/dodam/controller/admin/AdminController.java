package com.dodam.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;
import com.dodam.service.admin.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	
	@Inject
	private AdminService service;
	
	@RequestMapping("/adminhome")
	public void home() {
	}
	
	@RequestMapping("/members")
	public void members(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.selectAllMembers(pageNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<MemberVo> memList = (List<MemberVo>)map.get("memList");
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		int totalPost = (Integer)map.get("totalPost");
		
		model.addAttribute("memList", memList);
		model.addAttribute("pagingInfo", pi);
		model.addAttribute("totalPost", totalPost);
	}
	
	@RequestMapping("/board")
	public void board() {
	}
	
	@RequestMapping("/comment")
	public void comment() {
	}
	
	@ResponseBody
	@RequestMapping("/getMemberInfo")
	public MemberVo getMemberInfo(@RequestParam("userid") String userid) {
		return service.getMemberInfo(userid);
	}
}
