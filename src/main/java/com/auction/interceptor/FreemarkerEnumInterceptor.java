package com.auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import freemarker.ext.beans.BeansWrapper;

public class FreemarkerEnumInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setAttribute("enums", BeansWrapper.getDefaultInstance().getEnumModels());
		return true;
	}

}
