package com.dodam.controller.board.notice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String listAll(Model model, @RequestParam(value="pageNo", required=false, defaultValue = "1") String tmp)throws Exception{

		int pageNo = 1;
		if(!tmp.equals("") || tmp != null) {
			pageNo = Integer.parseInt(tmp);
			}
		logger.info(pageNo + "페이지 계시물 출력");
		
		Map<String, Object> map = service.selectnoticeall(pageNo);
		List<NoticeVo> lst = (List<NoticeVo>)map.get("boardList");
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		
		model.addAttribute("pagingInfo", pi); //페이징 정보
		model.addAttribute("listBoard", lst); //개시판 글 데이터
		
		return "/board/notice/listAll";
	}
	

	
	@RequestMapping(value="/createBoard", method = RequestMethod.POST)
	public String createBoard(NoticeVo vo, RedirectAttributes rttr) throws NamingException, SQLException {
		System.out.println(vo.toString());
		
		if (service.insertNotice(vo)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		return "/board/notice/createnotice";
		
	}
	
}


