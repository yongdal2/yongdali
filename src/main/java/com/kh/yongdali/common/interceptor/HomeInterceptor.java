package com.kh.yongdali.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.yongdali.member.controller.MemberController;
import com.kh.yongdali.member.model.vo.Member;

public class HomeInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return true;
		}
		else {
			if(loginUser.getPushEnabled() == null) {
//				request.setAttribute("isEasyAccessor", "Y");
				request.setAttribute("isEasyAccessor", true);
				request.getRequestDispatcher("/WEB-INF/views/login&signUp/policyChk.jsp").forward(request, response);
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
}
