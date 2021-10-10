package com.dodam.persistence.board.proud;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.proud.ProudVo;

@Repository
public class ProudDAOImpl implements ProudDAO {
	
	private static String namespace = "com.dodam.mapper.boardMapper";
	@Inject
	private SqlSession ses;
	
	@Override
	public List<ProudVo> selectAllBoard(int pageNo,PagingProud pi) throws NamingException, SQLException {

		   return ses.selectList(namespace + ".selectAllBoard", pi);
	}

	@Override
	public ProudVo selectBoard(int no) throws NamingException, SQLException {

		return ses.selectOne(namespace + ".selectBoard", no);
	}

	@Override
	public int insertBoardVo(ProudVo bo) throws NamingException, SQLException {
		int result = 0;
		   if (!bo.getImage().equals("")) { // 이미지 인 경우
			   bo.setImage("uploads/lcj" + bo.getImage());
			   bo.setThumbimage("uploads/lcj" + bo.getThumbimage());
			  result = ses.insert(namespace + ".createBoardWithImage", bo);
		  }
		  else if (bo.getImage().equals("")){ // 이미지 파일이 아닌경우
			  bo.setNoimage("uploads/lcj" + bo.getNoimage());
			  result = ses.insert(namespace + ".createBoardWithNoImage", bo);
		  }
		   return result;
	}

	@Override
	public int updateBoardVo(ProudVo bo) throws NamingException, SQLException {
		
		return ses.update(namespace + ".updateBoard", bo);
	}

	@Override
	public int deleteBoardVo(int no) throws NamingException, SQLException {
		return ses.delete(namespace + ".deleteboard", no);
	}

	@Override
	public int selectCntPost() throws NamingException, SQLException {
		   return ses.selectOne(namespace + ".getTotalPostCnt");
	}


}
