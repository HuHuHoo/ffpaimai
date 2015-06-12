package com.auction.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.commons.lang.StringUtils;

public class MessageUtil {
	public static String createMsg(String msg) {
		try {
			return "?msg=" + URLEncoder.encode(msg, "utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		return StringUtils.EMPTY;
	}

	public static String createWarning(String warning) {
		try {
			return "?warning=" + URLEncoder.encode(warning, "utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		return StringUtils.EMPTY;
	}

}
