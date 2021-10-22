package com.dodam.service.board.hospital;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.NamingException;

public interface HospitalService {
	//전체글 불러오기
		Map<String, Object> readAllBoard(int pageNo) throws NamingException, SQLException;;
}
