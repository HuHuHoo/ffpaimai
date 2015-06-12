package com.auction.domain;

import com.auction.constants.ArticleType;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by loovis on 8/27/14.
 */

@Entity
@Table(name = "article")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq", allocationSize = 1)
public class Article extends IdEntity {
    private Date operateDate;
    private String detail;
    private ArticleType type;

    public Article() {
        this.operateDate = new Date();
    }

    @Column(name = "operate_date")
    public Date getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    public ArticleType getType() {
        return type;
    }

    public void setType(ArticleType type) {
        this.type = type;
    }

}
