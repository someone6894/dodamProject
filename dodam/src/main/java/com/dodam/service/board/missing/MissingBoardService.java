package com.dodam.service.board.missing;

import java.util.Map;

import com.dodam.domain.missing.ListParamDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;

public interface MissingBoardService {
	
	// CREATE
	boolean insertBoard(MissingWriteDTO mw) throws Exception;
	
	
	// READ
	Map<String, Object> selectMissingBoardList(ListParamDTO lpd) throws Exception;

	MissingBoardVo getMissingBoard(int no) throws Exception;



	// UPDATE
	boolean updateBoard(MissingWriteDTO mw) throws Exception;
	
	boolean updateCategory(int no, String category);
	

	// DELETE
	boolean deleteBoard(int no) throws Exception;
	
}

