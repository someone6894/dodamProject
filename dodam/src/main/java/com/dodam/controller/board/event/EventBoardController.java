package com.dodam.controller.board.event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.domain.event.EventBoardVO;
import com.dodam.service.board.event.EventBoardService;




	@Controller
	@RequestMapping("/board/event/*")
	public class EventBoardController {

		@Inject
		private EventBoardService service;

		// 게시물 목록
		 @RequestMapping(value = "/list", method = RequestMethod.GET)
		 public void getList(Model model) throws Exception {
		  
			 List<EventBoardVO> list = null;
			 list = service.list();
			 
			 model.addAttribute("list", list);  
		 }
		 // 게시물 작성
		 @RequestMapping(value = "/write", method = RequestMethod.GET)
		 public void getWrite() throws Exception{
			 
		 }
		 //게시물 작성 post
		 @RequestMapping(value = "/write", method = RequestMethod.POST)
		 public String postWrite(EventBoardVO vo) throws Exception {
			 service.write(vo);
			 
			 return"redirect:/board/event/list";
		 }
		 
		 //게시물 조회
		 @RequestMapping(value = "/view", method = RequestMethod.GET)
		 public void getView(@RequestParam("no")int no, Model model) throws Exception{
			 EventBoardVO vo = service.view(no);
			 
			 model.addAttribute("view", vo);
		 }
		//게시물 수정
		 @RequestMapping(value = "/modify", method = RequestMethod.GET)
		 public void getModify(@RequestParam("no")int no, Model model) throws Exception {
			 EventBoardVO vo = service.view(no);
			 
			 model.addAttribute("view", vo);
		 }
		 
		 //게시물 수정 post
		 @RequestMapping(value = "/modify", method = RequestMethod.POST)
		 public String postModify(EventBoardVO vo) throws Exception {

		  service.modify(vo);
		  System.out.println(vo);
		    
		  return "redirect:/board/event/view?no=" + vo.getNo();
		 }
		 
		 //게시물 삭제
		 
		 @RequestMapping(value = "/delete", method = RequestMethod.GET)
		 public String getDelete(@RequestParam("no") int no) throws Exception {
		   
		  service.delete(no);  

		  return "redirect:/board/event/list";
		 }
		 
		 //게시물 목록 , 페이징 추가
		 @SuppressWarnings("unchecked")
		@RequestMapping(value = "/listPage", method = RequestMethod.GET)
		 public void getListpage(Model model, @RequestParam(value="num", required= false, defaultValue="1") int num) throws Exception {
			 
			 //게시물의 총갯수를 구하고, 한 페이지당 출력할 게시물 갯수 정하고, 
			 //하단에 표시할 페이징 번호 갯수 구하고
			 //현재 페이지를 기준으로 10개의 데이터를 출력함
			 
			 //게시물 총 갯수
			 int count = service.count();
			 
			 //한 페이지에 출력할 게시물 갯수
			 int postNum = 10;
			 
			 //하단 페이징 번호 [ (게시물 총 갯수 % 한페이지에 출력할 갯수) 의 올림]
			 int pageNum = (int)Math.ceil((double)count/postNum);
			 
			 //출력할 게시물 //매개변수 num은 페이지 번호 
			 int displayPost = (num -1) * postNum;
			 
			 
			 List<EventBoardVO> list= null; 
			 list= service.listPage(displayPost, postNum);
			 
			 System.out.println(pageNum);
			 
			 model.addAttribute("list",list);
			 model.addAttribute("pageNum", pageNum);
			 
		 }
		}

	
	