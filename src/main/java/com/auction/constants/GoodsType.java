package com.auction.constants;

import com.auction.domain.Goods;

/**
 * Created by loovis on 8/31/14.
 */
public enum GoodsType {
    realty("房地产"), art("字画 / 艺术品"), car("汽车"), interest("股票"), invisibleAssets("无形资产"), other("其他");
    private String desc;

    GoodsType(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
