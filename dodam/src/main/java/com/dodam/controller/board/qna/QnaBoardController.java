package com.dodam.controller.board.qna;

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


import com.dodam.domain.qna.PagingQna;
import com.dodam.domain.qna.QnaVo;
import com.dodam.service.board.qna.QnaBoardService;


@Controller
@RequestMapping("/board/qna/*")
public class QnaBoardController {
	@Inject
	private QnaBoardService service;

	private static Logger logger = LoggerFactory.getLogger(QnaBoardController.class);

	//전체 리스트
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String tmp) throws Exception {
		int pageNo = 1;
		if(!tmp.equals("") || tmp != null) {
			pageNo = Integer.parseInt(tmp);
		} 
		
		
		Map<String, Object> map = service.readAllBoard(pageNo);
		List<QnaVo> lst = (List<QnaVo>)map.get("boardList");
		PagingQna pi = (PagingQna)map.get("pagingInfo");

		System.out.println(lst.toString());
		
		

		model.addAttribute("pagingInfo", pi); // 페이징 정보0
		model.addAttribute("qnaListBoard", lst);  // 게시판 글 데이터

	}

	// 글 등록
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerBoard() {
		return "/board/qna/createBoard";
	}
//
	@RequestMapping(value="/createBoard", method = RequestMethod.POST)
	public String createBoard(QnaVo vo, RedirectAttributes rttr) throws NamingException, SQLException {
		System.out.println(vo.toString());
		
		if (service.addBoard(vo)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}

		return "redirect:/board/qna/listAll?pageNo=1";

	}

	@RequestMapping(value="/readBoard", method = RequestMethod.GET)
	public void readBoard(@RequestParam("no") String tmp, Model model) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);

		QnaVo vo = service.readBoard(no);

		model.addAttribute("board", vo);

	}

	@RequestMapping(value="/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("no") String tmp) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);

		service.deleteBoard(no);

		return "redirect:/board/qna/listAll?pageNo=1";
		
	}

	
	@RequestMapping(value="/modifyBoard", method = RequestMethod.GET)
	public String updateBoard(@RequestParam("no") int no, Model model) throws NamingException, SQLException {
		QnaVo vo = service.readBoard(no);
		
		model.addAttribute("QnaVo", vo);
		
		return "/board/qna/updateBoard";

	}
	
	

//	@RequestMapping(value="/updateBoard", method = RequestMethod.POST)
//	public String updateBoard(QnaVo vo) throws NamingException, SQLException {
//
//	}

	@RequestMapping(value="/updateBoard", method = RequestMethod.POST)
	public String updateBoard(@RequestParam("no") String tmp, QnaVo vo) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);

		
		service.updateBoard(vo);
		
		return "redirect:/board/qna/listAll?pageNo=1";
		

	}
}
