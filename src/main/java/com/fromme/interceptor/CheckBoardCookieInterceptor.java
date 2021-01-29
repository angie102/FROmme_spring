package com.fromme.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.fromme.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CheckBoardCookieInterceptor extends HandlerInterceptorAdapter {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie boardCookie = WebUtils.getCookie(request, "boardCookie");
		int post_no = Integer.parseInt(request.getParameter("post_no"));
		if(boardCookie == null) {
			service.updateReadCount(post_no);
			response.addCookie(new Cookie("boardCookie", post_no + ""));
		}
		
		return true;
	}
}
