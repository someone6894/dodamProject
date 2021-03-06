package com.dodam.service.board.missing;

import java.util.List;
import java.util.Map;

import com.dodam.domain.missing.ListParamDTO;
import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;

public interface MissingBoardService {
	
	// CREATE
	boolean insertBoard(MissingWriteDTO mw) throws Exception;
	
	
	// READ
	Map<String, Object> selectMissingBoardList(ListParamDTO lpd, int itemsPerPage) throws Exception;

	MissingBoardVo getMissingBoard(int no, String userid) throws Exception;



	// UPDATE
	boolean updateBoard(MissingWriteDTO mw) throws Exception;
	
	boolean updateCategory(int no, String category);
	

	// DELETE
	boolean deleteBoard(int no) throws Exception;


	boolean updateBookmark(int no, String userid);


	boolean updateUnbookmark(int no, String userid);


	int selectBookmarkCount(int no);


	boolean selectBookmark(int no, String userid);


	MissingBoardVo getMissingBoard(int no) throws Exception;


	List<MissingBoardListDTO> getRandomAnimal(Map<String, Object> map);


	List<MissingBoardListDTO> getRecommendation(Map<String, Object> paramMap);
	
}

