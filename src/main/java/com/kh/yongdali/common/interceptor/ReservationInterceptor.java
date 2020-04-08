package com.kh.yongdali.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.yongdali.member.model.vo.Member;

public class ReservationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			request.setAttribute("msg", "로그인 후 예약 가능합니다.");
			request.getRequestDispatcher("/loginView.me");
		}
		
		return super.preHandle(request, response, handler);
	}
	
	
}
