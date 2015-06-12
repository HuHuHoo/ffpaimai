package com.auction.util;

import javax.servlet.http.HttpServletRequest;

import com.auction.constants.HttpConstants;

public class AbsolutelyPathUtils {
	private static final int HTTP_SSL_PORT = 443;
	private static final int HTTP_COMMON_PORT = 80;

	public static String getAbsolutelypath(HttpServletRequest request) {
		if (request.getServerPort() == HTTP_COMMON_PORT) {
			return HttpConstants.HTTP_PROTOCOL + request.getServerName() + request.getContextPath();
		} else if (request.getServerPort() == HTTP_SSL_PORT) {
			return HttpConstants.HTTPS_PROTOCOL + request.getServerName() + request.getContextPath();
		} else {
			return HttpConstants.HTTP_PROTOCOL + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		}
	}
}
