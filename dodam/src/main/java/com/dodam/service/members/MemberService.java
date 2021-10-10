package com.dodam.service.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dodam.domain.members.MemberVo;

public interface MemberService {

	public boolean addMember(MemberVo m);
	
	public boolean sendMail(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	
	
	
	
	
	
}
