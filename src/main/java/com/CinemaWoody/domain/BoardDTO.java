package com.CinemaWoody.domain;

import java.io.Serializable;
import java.util.Objects;

public class BoardDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private int bno;
    private String title;
    private String content;
    private String mid;
    private String regDate;
    private String updateDate;
    private int viewCnt;

    public BoardDTO() {}

    public BoardDTO(int bno, String title, String content, String mid, String regDate, String updateDate, int viewCnt) {
        this.bno = bno;
        this.title = title;
        this.content = content;
        this.mid = mid;
        this.regDate = regDate;
        this.updateDate = updateDate;
        this.viewCnt = viewCnt;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    @Override
    public String toString() {
        return "BoardDTO{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", mid='" + mid + '\'' +
                ", regDate='" + regDate + '\'' +
                ", updateDate='" + updateDate + '\'' +
                ", viewCnt=" + viewCnt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BoardDTO boardDTO = (BoardDTO) o;
        return bno == boardDTO.bno && Objects.equals(mid, boardDTO.mid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, mid);
    }
}
