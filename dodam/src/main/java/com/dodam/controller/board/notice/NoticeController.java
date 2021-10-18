package com.dodam.controller.board.notice;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dodam.service.board.notice.NoticeService;

@Controller
public class NoticeController {

	@Inject
	private NoticeService service;

		 
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	private void notice() {
		
	}
	
}
