package com.dodam.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dodam.domain.members.MemberVo;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession ses = request.getSession();
		MemberVo loginmem = (MemberVo)ses.getAttribute("loginSession");
		
		// 로그인 하지 않았거나 아이디가 admin123이 아니면
		if (loginmem == null || !(loginmem.getIsadmin().equals("Y"))) {
			
			// index페이지로 이동
			response.sendRedirect("/");
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
