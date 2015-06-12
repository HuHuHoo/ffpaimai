package com.auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.auction.dao.UserDAO;

public class PrincipalAwareInterceptor extends HandlerInterceptorAdapter {

	private UserDetails userDetails;
	private String userName;
	@Autowired
	private UserDAO userDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			userDetails = (UserDetails) (SecurityContextHolder.getContext().getAuthentication().getPrincipal());
			userName = userDetails.getUsername();
			if (userName != null) {
				request.setAttribute("currentUser", userDAO.findByName(userName));
			}
		} catch (ClassCastException e) {
		}
		return super.preHandle(request, response, handler);
	}

}
