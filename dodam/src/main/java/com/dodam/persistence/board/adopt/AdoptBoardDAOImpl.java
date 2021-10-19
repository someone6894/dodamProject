package com.dodam.persistence.board.adopt;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.adopt.PagingInfoDTO;

@Repository
public class AdoptBoardDAOImpl implements AdoptBoardDAO {

	private static String namespace = "com.dodam.mapper.boardadoptMapper";

	@Inject
	private SqlSession ses;

	@Override
	public int insertBoardVo(AdoptVo bo) throws NamingException, SQLException {
		int result = 0;
		if (bo.getNotimage().equals("") && !bo.getImage().equals("")) { // 이미지 인경우
			bo.setImage("uploads" + bo.getImage());
			bo.setThumbimage("uploads" + bo.getThumbimage());
			result = ses.insert(namespace + ".createBoardWithImage", bo);
		} else if (bo.getImage().equals("") && !bo.getNotimage().equals("")) { // 이미지 파일이 아닌경우
			bo.setNotimage("uploads" + bo.getNotimage());
		} else if (bo.getImage().equals("") && bo.getImage().equals("")) { // 파일 올리지 않았을때
			result = ses.insert(namespace + ".createBoard", bo);
		}

//		result = ses.insert(namespace + ".createBoard", bo);
		return result;
	}
//
//	@Override
//	public List<BoardVo> selectAllBoard(int pageNo, PagingInfoDTO pi) throws NamingException, SQLException {
//		return ses.selectList(namespace + ".selectAllBoard", pi);
//	}

	// adoptboardUser 게시글 전체 출력
	@Override
	public List<AdoptVo> selectAllAdopt(int pageNo, PagingInfoDTO pi) throws NamingException, SQLException {
//		return ses.selectList(namespace + ".selectAllAdopt");
		
		List<AdoptVo> lst = null;
		lst = ses.selectList(namespace + ".selectAllAdopt", pi);
		
		return lst;
	}


	@Override
	public int selectCntPost() throws NamingException, SQLException {
		return Integer.parseInt( (String) ses.selectOne(namespace + ".getTotalPostCnt") );
	}
	
	
	// adoptboardUser 게시글 상세페이지 조회
	@Override
	public AdoptVo selectBoard(int no) throws NamingException, SQLException {

		return ses.selectOne(namespace + ".selectBoard", no);
	}

	// adoptboardUser 게시글 조회수 카운트
	@Override
	public int updateReadCnt(int no) throws NamingException, SQLException {
		return ses.update(namespace + ".increaseReadCnt", no);
	}

	// adoptboardUser 게시글 삭제
	@Override
	public void deleteBoard(int no) throws NamingException, SQLException {

		ses.selectOne(namespace + ".deleteBoard", no);
	}
	
	// adoptboardUser 게시글 수정
	@Override
	public int updateBoard(AdoptVo bo) throws NamingException, SQLException {
		int result = 0;
		if (bo.getNotimage().equals("") && !bo.getImage().equals("")) { // 이미지 인경우
			bo.setImage("uploads" + bo.getImage());
			bo.setThumbimage("uploads" + bo.getThumbimage());
			result = ses.update(namespace + ".updateBoardWithImage", bo);
		} else if (bo.getImage().equals("") && !bo.getNotimage().equals("")) { // 이미지 파일이 아닌경우
			bo.setNotimage("uploads" + bo.getNotimage());
		} else if (bo.getImage().equals("") && bo.getImage().equals("")) { // 파일 올리지 않았을때
			result = ses.update(namespace + ".updateBoard", bo);
		}

		return result;
	}
	
	

//	@Override
//	public int selectCntPost() throws NamingException, SQLException {
//		return Integer.parseInt(ses.selectOne(namespace + ".getTotalPostCnt"));
//	}

	// adoptboardPublic show list all
//	@Override
//	public List<AdoptVo> selectAllAdoptPublic() throws NamingException, SQLException {
//		return ses.selectList(namespace + ".selectAllBoardPublic");
//	}

}
