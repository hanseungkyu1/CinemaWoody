package com.CinemaWoody.domain;

import java.io.Serializable;
import java.util.Objects;

public class MemberDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private String mid;
    private String mname;
    private String email;
    private String pwd1;
    private String pwd2;
    private String phone;
    private String birth;

    private String postcode;
    private String address1;
    private String address2;

    public MemberDTO() {}

    public MemberDTO(String mid, String mname, String email, String pwd1, String pwd2, String phone, String birth, String postcode, String address1, String address2) {
        this.mid = mid;
        this.mname = mname;
        this.email = email;
        this.pwd1 = pwd1;
        this.pwd2 = pwd2;
        this.phone = phone;
        this.birth = birth;
        this.postcode = postcode;
        this.address1 = address1;
        this.address2 = address2;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd1() {
        return pwd1;
    }

    public void setPwd1(String pwd1) {
        this.pwd1 = pwd1;
    }

    public String getPwd2() {
        return pwd2;
    }

    public void setPwd2(String pwd2) {
        this.pwd2 = pwd2;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirth() {
        return birth;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "mid='" + mid + '\'' +
                ", mname='" + mname + '\'' +
                ", email='" + email + '\'' +
                ", pwd1='" + pwd1 + '\'' +
                ", pwd2='" + pwd2 + '\'' +
                ", phone='" + phone + '\'' +
                ", birth='" + birth + '\'' +
                ", postcode='" + postcode + '\'' +
                ", address1='" + address1 + '\'' +
                ", address2='" + address2 + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MemberDTO memberDTO = (MemberDTO) o;
        return Objects.equals(mid, memberDTO.mid) && Objects.equals(mname, memberDTO.mname) && Objects.equals(pwd1, memberDTO.pwd1) && Objects.equals(pwd2, memberDTO.pwd2);
    }

    @Override
    public int hashCode() {
        return Objects.hash(mid, mname, pwd1, pwd2);
    }
}
