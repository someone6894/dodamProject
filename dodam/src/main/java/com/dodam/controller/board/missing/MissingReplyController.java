package com.dodam.controller.board.missing;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.domain.missing.MissingReplyVo;
import com.dodam.service.board.missing.MissingReplyService;

@RestController
@RequestMapping("/missing/reply")
public class MissingReplyController {
	
	@Inject
	private MissingReplyService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> registerReply(@RequestBody MissingReplyVo mrv) {
		
		if (service.insertReply(mrv)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@RequestMapping(value="/viewAll/{pno}", method=RequestMethod.GET)
	public List<MissingReplyVo> viewAllReply(@PathVariable("pno") int pno) {
		
		List<MissingReplyVo> lst = service.selectAllReply(pno);
		System.out.println(lst);
		return lst;
	}
	
	@RequestMapping(value="/{no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("no") int no) {
		
		System.out.println(no);
		if (service.deleteReply(no)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value="/{no}", method=RequestMethod.PUT)
	public ResponseEntity<String> updateReply(@PathVariable("no") int no, @RequestBody MissingReplyVo mrv) {
		
		if (service.updateReply(mrv)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
}
