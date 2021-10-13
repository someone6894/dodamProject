package com.dodam.service.board.missing;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;

public interface MissingBoardService {
	
	// CREATE
	boolean insertBoard(MissingWriteDTO mw);
	
	
	// READ
	Map<String, Object> selectMissingBoardList(int pageNo) throws NamingException, SQLException;

	MissingBoardVo getMissingBoard(int no);



	// UPDATE
	boolean updateBoard(MissingWriteDTO mw);
	
	boolean changeToFound(int no);
	

	// DELETE
	boolean deleteBoard(int no);
	
}

