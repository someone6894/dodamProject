package com.dodam.persistence.board.missing;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.dodam.domain.missing.BookmarkVo;
import com.dodam.domain.missing.ListParamDTO;
import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.ReadCntVo;
import com.dodam.domain.missing.RecommendVo;

public interface MissingBoardDAO {

	// Read
	// 게시판 목록 페이지 조회하는 메서드
	List<MissingBoardListDTO> selectMissingBoardList(ListParamDTO lpd);

	// 게시글 상세 페이지 조회하는 메서드
	MissingBoardVo getMissingBoard(int no);

	// 전체 게시글 수 조회하는 메서드
	int selectCntPost(ListParamDTO lpd);
	
	// 마지막 조회 날짜 조회하는 메서드
	Timestamp getLastReadTime(ReadCntVo ri);
	
	// Create
	// 게시물 등록하는 메서드
	int insertBoard(MissingWriteDTO mw);

	// 게시물 조회 기록하는 메서드
	int insertReadHistory(ReadCntVo ri);
	
	// Delete
	int deleteBoard(int no);

	
	// Update
	// 게시글 수정하는 메서드
	int updateBoard(MissingWriteDTO mw);

	// category를 found로 바꿔주는 메서드
	int updateCategory(Map<String, Object> categoryInfo);

	// 조회수 증가하는 메서드
	int updateReadCount(int no);

	// 북마크 횟수 증가
	int updateBookmark(int no);

	// 북마크 기록
	int insertBookmarkHistory(Map<String, Object> likeMap);

	// 북마크 횟수 감수
	int updateUnbookmark(int no);
	
	// 북마크 기록 삭제
	int deleteBookmarkHistory(Map<String, Object> likeMap);

	// 북마크 수 가져오기
	int selectBookmarkCount(int no);

	// 북마크 기록 가져오기
	BookmarkVo selectBookmark(Map<String, Object> likeMap);

	// 가장 많이 북마크한 동물의 종류와 횟수 조회
	RecommendVo getMostBookAnimal(String userid);

	// 랜덤으로 3개의 게시글 불러오기
	List<MissingBoardListDTO> getRandomAnimal(Map<String, Object> map);

	// 북마크를 많이 한 동물 종류로 게시글 불러오기
	List<MissingBoardListDTO> getBookedAnimal(Map<String, Object> map);













}
