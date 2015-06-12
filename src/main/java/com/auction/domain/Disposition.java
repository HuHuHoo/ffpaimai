package com.auction.domain;

import com.auction.constants.Constants;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Created by loovis on 9/25/14.
 */
@Entity
@Table(name = "disposition")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq", allocationSize = 1)
public class Disposition extends IdEntity {
    private String name;
    private String contact;
    private String sex;
    private String tel;
    private String email;
    private String address;
    private String other;
    private int status;
    private String result;

    public Disposition() {
        status= Constants.NEGTIVE_STATUS;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
