package com.dodam.controller.board.missing;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dodam.domain.missing.MissingReplyVo;
import com.dodam.service.board.missing.MissingReplyService;

@Controller
@RequestMapping("/missing/reply/*")
public class MissingReplyController {
	
	@Inject
	private MissingReplyService service;
	
	@RequestMapping("/register")
	public ResponseEntity<String> registerReply(MissingReplyVo mrv) {
		
		System.out.println(mrv.toString());
		if (service.insertReply(mrv)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@RequestMapping("/viewAll")
	public List<MissingReplyVo> viewAllReply(@RequestParam("pno") int pno) {
		
		List<MissingReplyVo> lst = service.selectAllReply(pno);
		System.out.println(lst);
		return lst;
	}
}
