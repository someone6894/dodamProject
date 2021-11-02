package com.dodam.controller.admin;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dodam.domain.admin.PagingInfoDTO;
import com.dodam.domain.members.MemberVo;
import com.dodam.service.admin.AdminService;
import com.sun.mail.iap.Response;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	
	@Inject
	private AdminService service;
	
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
	public String board() {
		return "/admin/missingBoard";
	}
	
	@RequestMapping("/comment")
	public void comment(Model model) {
		model.addAttribute("numOfComments", service.cntMissingComment());
		model.addAttribute("Comments", service.getMissingComments());
	}
	
	@ResponseBody
	@RequestMapping("/getMemberInfo")
	public MemberVo getMemberInfo(@RequestParam("userid") String userid) {
		return service.getMemberInfo(userid);
	}
	
	@RequestMapping(value="/infoupdate", method=RequestMethod.POST)
	public String updateMemberInfo(MemberVo member, RedirectAttributes rttr, HttpServletRequest request) {
		System.out.println("유저에게 입력받은 : " + member.toString());
		
		try {
			if (service.infoupdate(member)) {
				rttr.addFlashAttribute("result", "success");
				HttpSession ses = request.getSession();
				ses.removeAttribute("loginSession"); // 로그인세션 갱신
				ses.setAttribute("loginSession", member); // session에 member정보 loginSession 이름으로 할당함		
				
			} else {
				rttr.addFlashAttribute("result", "fail");
			}
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:members?userid=" + member.getUserid();
	}
	
	@RequestMapping(value="/pwdCheck", method=RequestMethod.POST)
	public ResponseEntity<String> pwdCheck(@RequestParam("userid") String userid, @RequestParam("password") String password) {		
		if (service.pwdCheck(userid, password)) {
			return new ResponseEntity<String>("exist", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("none", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/pwdChange", method=RequestMethod.POST)
	public ResponseEntity<String> changePwd(@RequestParam("userid") String userid, @RequestParam("password") String password) {
		try {
			if (service.changePwd(userid, password)) {
				return new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	public ResponseEntity<String> deleteUser(@RequestParam("userid") String userid) {
		System.out.println(userid);
		try {
			if (service.deleteUser(userid)) {
				return new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="searchId", method=RequestMethod.POST)
	public Map<String, Object> searchId(@RequestParam(value="pageNo", defaultValue="1") int pageNo, @RequestParam("searchId") String searchId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.searchMembers(pageNo, searchId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping("/admin/proud")
	public String proudComment() {
		return "/admin/proudComment";
	}
}
