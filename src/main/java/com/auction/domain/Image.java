package com.auction.domain;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Created by lb on 2014/8/24.
 */

@Entity
@Table(name = "image")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq", allocationSize = 1)
public class Image extends IdNameEntity {
    public static final int HOME_IMAGE_TYPE = 1;
    private static final long serialVersionUID = 9184879493790309634L;
    private String path;
    private int type;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
