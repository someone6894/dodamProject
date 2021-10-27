package com.dodam.service.board.qna;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dodam.domain.qna.QnaReplyVo;
import com.dodam.persistence.board.qna.QnaReplyDAO;



@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	@Inject
	private QnaReplyDAO dao;
	
	@Override
	public List<QnaReplyVo> listReply(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public boolean addReply(QnaReplyVo vo) throws Exception {
		boolean result = false;
		System.out.println("오냐");
		int row = dao.create(vo);
		if(row == 1) {
			result = true;
		}
		
		return result;
		
	}

	@Override
	public boolean modifyReply(QnaReplyVo vo) throws Exception {
		boolean result = false;
		
		int row = dao.update(vo);
		if(row == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean removeReply(int no) throws Exception {
		boolean result = false;
		
		int row = dao.delete(no);
		if(row == 1) {
			result = true;
		}
		
		return result;
	}

}
