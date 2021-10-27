package com.dodam.service.reply.proud;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.springframework.stereotype.Service;

import com.dodam.domain.members.MypointVo;
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

	@Override
	public boolean deleteReply(ReplyVo vo) throws Exception {
		boolean result = false;

		int row = dao.delete(vo);
		if (row == 1) {
			result = true;
		}
		
		return true;
	}

	@Override
	public boolean reReply(ReplyVo vo, int result2) throws Exception {
		boolean result = false;

		System.out.println(vo.toString());
		int row = dao.append(vo);
		if (row == 1) {
			result = true;
		}
		
		return result;
	}
	
	@Override
	public boolean addpoint(MypointVo vo) throws NamingException, SQLException {

		boolean result = false;

		if (dao.addpoint(vo) == 1) {
			result = true;
		}

		return result;

	}

	@Override
	public int replycount(ReplyVo vo) throws Exception {

		return dao.replycount(vo);
	}

	@Override
	public int maxreplyno() throws Exception {

		return dao.maxreplyno();
		
	}

}
