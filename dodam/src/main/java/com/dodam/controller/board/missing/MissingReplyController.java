package com.dodam.controller.board.missing;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dodam.domain.missing.MissingReplyVo;

@Controller
@RequestMapping("/missing/reply/*")
public class MissingReplyController {
	
	@RequestMapping("/register")
	public ResponseEntity<String> registerReply(MissingReplyVo mrv) {
		System.out.println(mrv);
		System.out.println("!");
		return null;
	}
}
