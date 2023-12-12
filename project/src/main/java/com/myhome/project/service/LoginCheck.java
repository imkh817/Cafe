package com.myhome.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheck implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("id") == null) {
			//response.sendRedirect("/project/main");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script>alert('로그인이 필요합니다.'); window.location='/project/main';</script>");
			
			return false;
			// id값이 null일때 return 값이 false 여야 가로채서 main으로 페이지를 보낸다. 

		}
		return true;

	}

}
