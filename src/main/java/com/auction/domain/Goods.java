package com.auction.domain;

import com.auction.constants.Constants;
import com.auction.constants.GoodsType;
import org.apache.commons.lang.time.DateUtils;

import javax.persistence.*;
import java.text.ParseException;
import java.util.Date;

/**
 * Created by loovis on 8/27/14.
 */
@Entity
@Table(name = "goods")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq", allocationSize = 1)
public class Goods extends IdEntity {
    private String name;
    private String price;
    private String tradeDate;
    private String state;
    private String image;
    private int status;
    private String detail;
    private GoodsType type;

    public Goods() {
        this.status = Constants.ACTIVE_STATUS;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Column(name = "trade_date")
    public String getTradeDate() {
        return tradeDate;
    }

    public void setTradeDate(String tradeDate) {
        this.tradeDate = tradeDate;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    public GoodsType getType() {
        return type;
    }

    public void setType(GoodsType type) {
        this.type = type;
    }

    @Transient
    public void switchStatus() {
        this.status = ((status + 1) % 2);
    }


}
