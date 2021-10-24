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
		
		System.out.println(mrv.toString());
		
		// 줄바꿈 -> 태그로 전환해서 저장(DB에는 개행문자 저장 안됨)
		mrv.setContents(mrv.getContents().replaceAll("(\r\n|\r|\n|\n\r)", "<br />"));
		
		if (mrv.getPid() == 0) { // 부모댓글의 번호가 0 즉, 부모 댓글이 없는 경우
			mrv.setPid(dao.selectNo());
			System.out.println("pid : " + mrv.getPid());
			if (dao.insertReply(mrv) == 1) {
				return true;
			}
		} else { // 부모댓글의 번호가 존재하는 경우(대댓글의 경우)
			MissingReplyVo p_mrv = dao.selectReply(mrv.getPid());
			mrv.setPid(p_mrv.getPid());
			mrv.setDepth(p_mrv.getDepth());
			mrv.setReforder(p_mrv.getReforder());
			
			if (dao.updateRef(mrv) >= 0) {
				if (dao.insertReReply(mrv) == 1) {
					return true;
				}
			}
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
		mrv.setIsmodified('Y');
		
		System.out.println(mrv.getLastmodifieddate());
		// 줄바꿈 -> 태그로 전환해서 저장(DB에는 개행문자 저장 안됨)
		mrv.setContents(mrv.getContents().replaceAll("(\r\n|\r|\n|\n\r)", "<br />"));
		if (dao.updateReply(mrv) == 1) {
			result = true;
		}
		
		return result;
	}

}
