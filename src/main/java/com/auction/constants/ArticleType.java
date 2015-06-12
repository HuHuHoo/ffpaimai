package com.auction.constants;

/**
 * Created by loovis on 10/8/14.
 */
public enum ArticleType {
    about("公司简介","公司简介"),structure("组织架构","组织架构"),
    promise("服务承诺","服务承诺"),environment("办公环境","办公环境"),
    honor("荣誉室大事记","荣誉室大事记");
    private String desc;
    private String abbr;

    ArticleType(String desc, String abbr) {
        this.desc = desc;
        this.abbr = abbr;
    }
}
