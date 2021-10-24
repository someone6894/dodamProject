package com.dodam.controller.board.qna;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.domain.qna.QnaReplyVo;
import com.dodam.service.board.qna.QnaReplyService;



@RestController  // 현재 클래스가 REST 방식의 컨트롤러임을 명시
@RequestMapping("qna/replies")
public class QnaReplyController {
	@Inject
	private QnaReplyService service;
	
	@RequestMapping(value="create", method=RequestMethod.POST)
	public ResponseEntity<String> addReply(@RequestBody QnaReplyVo vo) {
		System.out.println("Replies... POST... 글등록 시작");
		ResponseEntity<String> result = null;
		try {
			service.addReply(vo);
			result = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<QnaReplyVo>> list(@PathVariable("bno") int bno) { // URI에서 bno값을 추출하여 변수 bno에 할당
		
		ResponseEntity<List<QnaReplyVo>> result = null;
		try {
			List<QnaReplyVo> lst = service.listReply(bno);
			result = new ResponseEntity<List<QnaReplyVo>>(lst, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	@RequestMapping(value="/{no}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("no") int no, @RequestBody QnaReplyVo vo) {
		ResponseEntity<String> result = null;
		
		try {
			service.modifyReply(vo);
			result = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	@RequestMapping(value="/{no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("no") int no) {
		ResponseEntity<String> result = null;
		
		try {
			service.removeReply(no);
			result = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
}
