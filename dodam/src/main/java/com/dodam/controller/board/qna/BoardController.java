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

import com.dodam.domain.qna.QnaVo;
import com.dodam.service.board.qna.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private BoardService service;

	private static Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "qna/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {

		Map<String, Object> map = service.readAllBoard();
		List<QnaVo> lst = (List<QnaVo>)map.get("boardList");

		model.addAttribute("listBoard", lst);  // 게시판 글 데이터

	}

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
}
