package com.auction.constants;

public class Constants implements HttpConstants {
    private Constants() {
    }

    public static final int NEGTIVE_STATUS = 0;
    public static final int ACTIVE_STATUS = 1;
    public static final String BR = "<br/>";
    public static final String SEPARATOR = System.getProperty("line.separator");
    public static final String DEFAULT_ENCODING = "UTF-8";
    public static final String ABSOLUTE_CONTEXT_PATH_NAME = "ctx";
    public static final String CURRENT_USER_PARAM_NAME = "currentUser";
    public static final String YYYYMMDD = "yyyy-MM-dd";
    public static final String OK = "OK";
    public static final String DEFAULT_PASSWORD = "888888";
    public static final String UPLOAD_PATH = "/var/www/html/uploads/";
}
