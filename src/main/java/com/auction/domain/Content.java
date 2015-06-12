package com.auction.domain;

import com.auction.constants.ContentType;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by loovis on 8/31/14.
 */
@Entity
@Table(name = "content")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq", allocationSize = 1)
public class Content extends IdEntity {
    private String name;
    private ContentType type;
    private Date operateDate;
    private String summary;
    private String detail;

    public Content() {
        this.operateDate=new Date();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    public ContentType getType() {
        return type;
    }

    public void setType(ContentType type) {
        this.type = type;
    }
    @Column(name = "operate_date")
    public Date getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
