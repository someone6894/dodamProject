package com.dodam.controller.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.adopt.PagingInfoDTO;
import com.dodam.domain.event.EventBoardVO;
import com.dodam.service.board.adopt.AdoptBoardService;
import com.dodam.service.board.event.EventBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private AdoptBoardService adoptService;  
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		HttpSession ses = request.getSession();
		ses.removeAttribute("userid"); // 로그인한 아이디 갱신
		
		model.addAttribute("serverTime", formattedDate );
		
		int pageNo = 1;
		Map<String, Object> map = adoptService.readAllAdopt(pageNo);
		List<AdoptVo> lst = (List<AdoptVo>) map.get("boardList");
		model.addAttribute("listBoard", lst); // 게시판 글 데이터
		
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		model.addAttribute("pagingInfo", pi); // 페이징 정보
		
		// 다른 게시판들들도 service 객체 주입하고 controller 가져와서 boardmini.jsp 파싱제대로 하면 메인에 게시판 출력가능.
		
		return "index";
		
	}
	
	
}
