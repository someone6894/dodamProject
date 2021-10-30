package com.dodam.controller.board.proud;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.ReplyVo;
import com.dodam.service.reply.proud.ReplyService;

@RestController  // 현재 클래스가 REST 방식의 컨트롤러임을 명시
@RequestMapping("/replies")

public class ReplyController {

	   @Inject
	   private ReplyService service;
	   
	   @RequestMapping(value="/create", method=RequestMethod.POST)
	   public ResponseEntity<String> addReply(@RequestBody ReplyVo vo, HttpServletRequest request) { // responseentity는 모델 개념 , 응답하는 데이터

		  HttpSession ses = request.getSession();				
		  String userid = (String)ses.getAttribute("userid"); // 접속한 유저아이디
	      
		  System.out.println(vo.toString());
	      ResponseEntity<String> result = null;
	      int maxno = 0;
	      try { // ajax니까 공통서블릿 말고 여기서 처리하도록 한다.
	    	 maxno = service.maxreplyno();
	    	 vo.setNo(maxno);
	    	 System.out.println(vo);
	         if(service.addReply(vo)) {
			 service.addpoint(new MypointVo(userid, null, 2, "댓글 작성"));
			 service.updatereplycount(vo);
	         result = new ResponseEntity<String>("success", HttpStatus.OK);
	         }
	      } catch (Exception e) {
	         result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	      }
	      
	      return result;
	   }
	   
	   @RequestMapping(value="/replies", method=RequestMethod.POST)
	   public ResponseEntity<String> reReply(@RequestBody ReplyVo vo, HttpServletRequest request) { // responseentity는 모델 개념 , 응답하는 데이터
	      System.out.println(vo.toString());

	      int result2 = 0;
	      
		  HttpSession ses = request.getSession();				
		  String userid = (String)ses.getAttribute("userid"); // 접속한 유저아이디

		  int maxno = 0;
	      ResponseEntity<String> result = null;
	      try { // ajax니까 공통서블릿 말고 여기서 처리하도록 한다.
	    	  	result2 = service.replycount(vo);
	    	  	System.out.println(result2);
		    	 maxno = service.maxreplyno();
		    	 vo.setNo(maxno);
		    	 System.out.println(vo);
	    	  	if(service.reReply(vo, result2)) {
				service.addpoint(new MypointVo(userid, null, 2, "댓글 작성"));
				service.updatereplycount(vo);
				result = new ResponseEntity<String>("success", HttpStatus.OK);
	    	  	}
	    	  	else {
	    	  		System.out.println("작성 실패");
	    	  	}
	      } catch (Exception e) {
	         result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	      }
	      
	      return result;
	   }
	   
	   @RequestMapping(value="/all/{bno}", method = RequestMethod.GET)
	   public ResponseEntity<List<ReplyVo>> list(@PathVariable("bno") int bno) { // URI에서 bno 값을 추출하여 변수 bno에 할당

		   ResponseEntity<List<ReplyVo>> result = null;
		   
		   try {
		   		List<ReplyVo> lst = service.ListReply(bno);
		   		result = new ResponseEntity<List<ReplyVo>>(lst, HttpStatus.OK);
			} catch (Exception e) {
		   		result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		   
		   return result;
	   }
	   
	   @RequestMapping(value="/update", method=RequestMethod.POST)
	   public ResponseEntity<String> updateReply(@RequestBody ReplyVo vo) { // responseentity는 모델 개념 , 응답하는 데이터
	      
		  System.out.println(vo.toString());
	      ResponseEntity<String> result = null;
	      try { // ajax니까 공통서블릿 말고 여기서 처리하도록 한다.
	         service.updateReply(vo);
	         result = new ResponseEntity<String>("success", HttpStatus.OK);
	      } catch (Exception e) {
	         result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	      }
	      
	      return result;
	   }
	   
	   @RequestMapping(value="/delete", method=RequestMethod.POST)
	   public ResponseEntity<String> deleteReply(@RequestBody ReplyVo vo) { // responseentity는 모델 개념 , 응답하는 데이터

		   System.out.println(vo.toString());
		   ResponseEntity<String> result = null;		   
		   try { // ajax니까 공통서블릿 말고 여기서 처리하도록 한다.
		         if(service.deleteReply(vo)) {
				 service.updatereplycount(vo);
		         result = new ResponseEntity<String>("success", HttpStatus.OK);
		         }
		      } catch (Exception e) {
		         result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		      }
		   
		   return result;
	   }
	   
}
