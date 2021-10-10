package com.dodam.persistence.board.missing;

import java.util.List;

import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.PagingInfoDTO;

public interface MissingBoardDAO {

	List<MissingBoardListDTO> selectMissingBoardList(PagingInfoDTO pi);

	MissingBoardVo getMissingBoard(int no);

	int insertBoard(MissingWriteDTO mw);

	int deleteBoard(int no);

	int updateBoard(MissingWriteDTO mw);

	int selectCntPost();

}
