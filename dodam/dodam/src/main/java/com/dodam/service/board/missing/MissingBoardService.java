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
	
	// READ
	Map<String, Object> selectMissingBoardList(int pageNo) throws NamingException, SQLException;

	MissingBoardVo getMissingBoard(int no);

	boolean insertBoard(MissingWriteDTO mw);

	boolean deleteBoard(int no);

	boolean updateBoard(MissingWriteDTO mw);
	
	// UPDATE
	
	// DELETE
}

