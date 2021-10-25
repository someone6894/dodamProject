package com.dodam.service.board.missing;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.domain.missing.ListParamDTO;
import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.PagingInfoDTO;
import com.dodam.domain.missing.ReadCntVo;
import com.dodam.etc.missing.IPChecking;
import com.dodam.persistence.board.missing.MissingBoardDAO;

@Service
public class MissingBoardServiceImpl implements MissingBoardService{

	@Inject
	private MissingBoardDAO dao;

	@Override
	public Map<String, Object> selectMissingBoardList(ListParamDTO lpd, int itemsPerPage) throws Exception {
		 PagingInfoDTO pi = pagingProcess(lpd, itemsPerPage);
		 
		 lpd.setStartNum(pi.getStartNum());
		 lpd.setPostPerPage(pi.getPostPerPage());
		 
		 List<MissingBoardListDTO> lst = dao.selectMissingBoardList(lpd);
		 for(MissingBoardListDTO ld : lst) {
			 if(ld.getImg().length() > 1) {
				 ld.setImg(ld.getImg().split(",")[0]);
			 }
			 
			 if (ld.getGender().equals("M")) {
				 ld.setGender("수컷");
			 } else if (ld.getGender().equals("F")) {
				 ld.setGender("암컷");
			 } else {
				 ld.setGender("성별모름");
			 }
		 }
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("listMissingBoard", lst);
		 map.put("pagingInfo", pi);
		 
		 return map;
	}

	@Override
	public boolean insertBoard(MissingWriteDTO mw) throws Exception {
		boolean result = false;
		// 타이틀에 태그 실행 방지
        mw.setTitle(mw.getTitle().replace("<", "&lt;")); 
        mw.setTitle(mw.getTitle().replace(">", "&gt;")); 
        
		// escape문자들 -> 태그로 전환해서 저장(DB에는 개행문자 등이 저장 안됨)
        mw.setContents(mw.getContents().replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;"));
		mw.setContents(mw.getContents().replaceAll("(\r\n|\r|\n|\n\r)", "<br />"));
		
		
		if (dao.insertBoard(mw)==1) {
			result = true;
		}
		
		return result;
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED) // 조회수 update문이 commit된 데이터(DML문이 먼저 나와야 한다)에 한해 select되도록 격리 레벨을 올림
	@Override
	public MissingBoardVo getMissingBoard(int no, String userid) throws Exception {
		if (userid == "") {
			IPChecking ipCheck = new IPChecking();
			userid = ipCheck.getIp(); // ip 주소
		}

		ReadCntVo ri = new ReadCntVo(no, userid, null, null); 
		
		Timestamp ts = dao.getLastReadTime(ri);
		
		if (ts == null) { // (ip, readno)의 조회 정보가 없으면
			// 조회정보를 새롭게 입력
			if(dao.insertReadHistory(ri)==1) {
				dao.updateReadCount(no);
			}
		} else { // 조회 정보가 있으면
			long readTime = ts.getTime();
			long currentTime = System.currentTimeMillis();
			long timeDiff = currentTime - readTime;
			
			if (timeDiff > 24 * 60 * 60 * 1000) { // 마지막 조회 이후 24시간 초과했다면
				if (dao.insertReadHistory(ri)==1) { // 조회정보 새롭게 입력
					dao.updateReadCount(no); // 조회수 증가
				}
			}
		}
		
		MissingBoardVo mbv = dao.getMissingBoard(no);

		return mbv;
	}
	
	@Override
	public MissingBoardVo getMissingBoard(int no) throws Exception {
		
		MissingBoardVo mbv = dao.getMissingBoard(no);
		
		return mbv;
	}

	@Override
	public boolean deleteBoard(int no) throws Exception {
		boolean result = false;
		if (dao.deleteBoard(no)==1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateBoard(MissingWriteDTO mw) throws Exception {
		boolean result = false;
		if (dao.updateBoard(mw)==1) {
			result = true;
		}
		
		return result;
	}
	

	@Override
	public boolean updateCategory(int no, String category) {
		boolean result = false;
		Map<String, Object> categoryInfo = new HashMap<String, Object>();
		categoryInfo.put("no", no);
		categoryInfo.put("category", category);
		
		if (dao.updateCategory(categoryInfo) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateBookmark(int no, String userid) {
		System.out.println(no + ", " + userid);
		boolean result = false;
		int countUp = dao.updateBookmark(no);
		
		Map<String, Object> bookMap = new HashMap<String, Object>();
		bookMap.put("userid", userid);
		bookMap.put("no", no);
		
		int addHistory = dao.insertBookmarkHistory(bookMap);
		
		if (countUp == 1 || addHistory == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateUnbookmark(int no, String userid) {
		System.out.println(no + ", " + userid);
		boolean result = false;
		int countUp = dao.updateUnbookmark(no);
		
		Map<String, Object> bookMap = new HashMap<String, Object>();
		bookMap.put("userid", userid);
		bookMap.put("no", no);
		
		int addHistory = dao.deleteBookmarkHistory(bookMap);
		
		if (countUp == 1 || addHistory == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public int selectBookmarkCount(int no) {
		return dao.selectBookmarkCount(no);
	}

	@Override
	public boolean selectBookmark(int no, String userid) {
		boolean result = false;
		Map<String, Object> bookMap = new HashMap<String, Object>();
		bookMap.put("no", no);
		bookMap.put("userid", userid);
		if (dao.selectBookmark(bookMap) != null) {
			result = true;
		}
		return result;
	}

	
	// 페이징을 위한 처리 작업 전담 메서드
	private PagingInfoDTO pagingProcess(ListParamDTO lpd, int itemsPerPage) throws Exception {
		PagingInfoDTO pi = new PagingInfoDTO();
		
		pi.setPostPerPage(itemsPerPage);
		pi.setPageCntPerBlock(10);
		
		pi.setStartNum(lpd.getPageNo()); // 출력 시작할 번호
		int totalPost = 0;
		totalPost = dao.selectCntPost(lpd); // 전체 글 수를 얻음
		pi.setTotalPage(totalPost); // 전체 페이지 수
		pi.setCurrentPagingBlock(lpd.getPageNo()); // 현재 페이지가 속한 블록
		
		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock()); // 시작 페이지 블록
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock()); // 끝 페이지 블록
		pi.setTotalPagingBlockCnt(pi.getTotalPage()); // 페이지 블록의 개수
		
		System.out.println(pi.toString());
		
		return pi;
	}
}
