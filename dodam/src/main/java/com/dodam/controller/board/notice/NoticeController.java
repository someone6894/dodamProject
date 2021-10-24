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
		 
	//페이지 전체 보여주기
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
	

	//공지사항 작성페이지로
	@RequestMapping(value = "/createBoard", method = RequestMethod.GET)
	public String createBoard() throws NamingException, SQLException {
		return "/board/notice/createBoard";
	}
	
	//작성페이지에서 작성을 하고나서 리스트페이지로 이동
	@RequestMapping(value ="/listAll", method=RequestMethod.POST)
	public String postwrite(NoticeVo vo)throws NamingException, SQLException{
		
		
		return "redirect:listAll";
	}
	
	//공지사항 작성페이지로
		@RequestMapping(value = "/createview", method = RequestMethod.POST)
		public String createview(NoticeVo vo, RedirectAttributes rttr) throws NamingException, SQLException {

			if (service.createview(vo)) {
				rttr.addFlashAttribute("result", "success");
			} else {
				rttr.addFlashAttribute("result", "fail");
			}
			
			return "redirect:/board/notice/listAll";
		}
		
	
	// 공지사항 자세히 보기
	@RequestMapping(value = "/board/notice/readBoard", method=RequestMethod.GET)
	public void readBoard(@RequestParam("no") String tmp, Model model)throws NamingException, SQLException{
		int no = Integer.parseInt(tmp);
		
		NoticeVo vo = service.selectnotice(no);
		model.addAttribute("board", vo);
	}
	
	// 공지사항 수정하기
	@RequestMapping(value = "/board/notice/updateBoard", method=RequestMethod.GET)
	public void updateBoard(@RequestParam("no") String tmp, Model model)throws NamingException, SQLException{
		int no = Integer.parseInt(tmp);
		
		NoticeVo vo = service.selectnotice(no);
		model.addAttribute("board", vo);
	}
	

	// 공지사항 수정하기
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeVo vo, RedirectAttributes rttr) throws NamingException, SQLException {
	
		System.out.println(vo.toString());
		
		if (service.update(vo)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		return "redirect:/board/notice/listAll";
	}
	
	
	
	//공지사항 삭제하기
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("no") String tmp, RedirectAttributes rttr) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		
		if (service.delete(no)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		return "redirect:/board/notice/listAll";
	}
	
	//@RequestParam("no") String tmp // ?뒤에 번호가져오는것.
}


