package com.auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.auction.constants.Constants;
import com.auction.util.AbsolutelyPathUtils;

public class AbsolutelyPathInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setAttribute(Constants.ABSOLUTE_CONTEXT_PATH_NAME, AbsolutelyPathUtils.getAbsolutelypath(request));
		return super.preHandle(request, response, handler);
	}

}
