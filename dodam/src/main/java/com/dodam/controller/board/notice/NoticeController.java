package com.dodam.controller.board.notice;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.domain.notice.NoticeVo;
import com.dodam.domain.notice.PagingInfoDTO;
import com.dodam.service.board.notice.NoticeService;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {

	@Inject
	private NoticeService service;
	private static Logger logger= LoggerFactory.getLogger(NoticeController.class);
		 
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model, @RequestParam(value="pageNo", required=false, defaultValue = "1") String tmp)throws Exception{

		int pageNo = 1;
		if(!tmp.equals("") || tmp != null) {
			pageNo = Integer.parseInt(tmp);
			}
		logger.info(pageNo + "페이지 계시물 출력");
		
		Map<String, Object> map = service.readAllBoard(pageNo);
		List<NoticeVo> lst = (List<NoticeVo>)map.get("boardList");
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		
		model.addAttribute("pagingInfo", pi); //페이징 정보
		model.addAttribute("listBoard", pi); //개시판 글 데이터
	}
	
	@RequestMapping(value="/register", method= RequestMethod.GET)
	public String registerBoard() {
		return "/board/notice/createnotice";
			
	}
	
}


