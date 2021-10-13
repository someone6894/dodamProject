package com.dodam.persistence.board.missing;

import java.util.List;

import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.PagingInfoDTO;

public interface MissingBoardDAO {

	// Read
	List<MissingBoardListDTO> selectMissingBoardList(PagingInfoDTO pi);

	MissingBoardVo getMissingBoard(int no);

	int selectCntPost();
	
	// Create
	int insertBoard(MissingWriteDTO mw);

	
	// Delete
	int deleteBoard(int no);

	
	// Update
	int updateBoard(MissingWriteDTO mw);

	int updateToFound(int no);

}
