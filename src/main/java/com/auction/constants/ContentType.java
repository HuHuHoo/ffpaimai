package com.auction.constants;

/**
 * Created by loovis on 8/31/14.
 */
public enum ContentType {
    news("新闻中心", "新闻"), classic("经典回顾", "经典回顾"), tend("行业动态", "行业动态"),
    instruction("买受人须知", "买受人须知"), flow("拍卖流程", "拍卖流程"),
    law("拍卖法规", "拍卖法规"), analysis("拍卖分析", "拍卖分析"), question("常见问题", "常见问题");

    ContentType(String desc, String abbr) {
        this.desc = desc;
        this.abbr = abbr;
    }

    public String getDesc() {
        return desc;
    }

    private String desc;

    public String getAbbr() {
        return abbr;
    }

    private String abbr;
}
