package com.fromme.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class DeleteBoardCookieInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Cookie boardCookie = WebUtils.getCookie(request, "boardCookie");
		
		if(boardCookie != null) {
			boardCookie.setMaxAge(0);
			response.addCookie(boardCookie);
		}
		
		return true;
	}
}
