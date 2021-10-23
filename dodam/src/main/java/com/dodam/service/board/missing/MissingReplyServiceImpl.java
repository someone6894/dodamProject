package com.dodam.service.board.missing;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dodam.domain.missing.MissingReplyVo;
import com.dodam.persistence.board.missing.MissingReplyDAO;

@Service
public class MissingReplyServiceImpl implements MissingReplyService {
	
	@Inject
	private MissingReplyDAO dao;

	@Override
	public boolean insertReply(MissingReplyVo mrv) {
		boolean result = false;
		
		// 줄바꿈 -> 태그로 전환해서 저장(DB에는 개행문자 저장 안됨)
		mrv.setContents(mrv.getContents().replaceAll("(\r\n|\r|\n|\n\r)", "<br />"));
		if (dao.insertReply(mrv) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<MissingReplyVo> selectAllReply(int pno) {
		return dao.selectAllReply(pno);
	}

	@Override
	public boolean deleteReply(int no) {
		boolean result = false;
		if (dao.deleteReply(no) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateReply(MissingReplyVo mrv) {
		boolean result = false;
		
		mrv.setLastmodifieddate(new Timestamp(System.currentTimeMillis()));
		System.out.println(mrv.getLastmodifieddate());
		if (dao.updateReply(mrv) == 1) {
			result = true;
		}
		
		return result;
	}

}
