package com.dodam.service.reply.proud;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dodam.domain.proud.ReplyVo;
import com.dodam.persistence.reply.proud.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVo> ListReply(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public boolean addReply(ReplyVo vo) throws Exception {
		boolean result = false;

		int row = dao.create(vo);
		if (row == 1) {
			result = true;
		}
		
		return true;
	}

	@Override
	public boolean updateReply(ReplyVo vo) throws Exception {
		boolean result = false;

		int row = dao.update(vo);
		if (row == 1) {
			result = true;
		}
		
		return true;
	}

}
