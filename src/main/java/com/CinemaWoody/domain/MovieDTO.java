package com.CinemaWoody.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Objects;

public class MovieDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private int mNo;
    private String regDate;
    private String mTitle;
    private String director;
    private String actor;
    private String category;
    private int runningTime;
    private String openDate;
    private String grade;
    private String introduction;

    private String[] insertFiles;
    private String[] deleteFiles;
    private String fileName;

    public MovieDTO() {}

    public MovieDTO(int mNo, String regDate, String mTitle, String director, String actor, String category, int runningTime, String openDate, String grade, String introduction) {
        this.mNo = mNo;
        this.regDate = regDate;
        this.mTitle = mTitle;
        this.director = director;
        this.actor = actor;
        this.category = category;
        this.runningTime = runningTime;
        this.openDate = openDate;
        this.grade = grade;
        this.introduction = introduction;
    }

    public MovieDTO(int mNo, String regDate, String mTitle, String director, String actor, String category, int runningTime, String openDate, String grade, String introduction, String[] insertFiles, String[] deleteFiles, String fileName) {
        this.mNo = mNo;
        this.regDate = regDate;
        this.mTitle = mTitle;
        this.director = director;
        this.actor = actor;
        this.category = category;
        this.runningTime = runningTime;
        this.openDate = openDate;
        this.grade = grade;
        this.introduction = introduction;
        this.insertFiles = insertFiles;
        this.deleteFiles = deleteFiles;
        this.fileName = fileName;
    }

    public int getmNo() {
        return mNo;
    }

    public void setmNo(int mNo) {
        this.mNo = mNo;
    }

    public String getmTitle() {
        return mTitle;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getRunningTime() {
        return runningTime;
    }

    public void setRunningTime(int runningTime) {
        this.runningTime = runningTime;
    }

    public String getOpenDate() {
        return openDate;
    }

    public void setOpenDate(String openDate) {
        this.openDate = openDate;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String[] getInsertFiles() {
        return insertFiles;
    }

    public void setInsertFiles(String[] insertFiles) {
        this.insertFiles = insertFiles;
    }

    public String[] getDeleteFiles() {
        return deleteFiles;
    }

    public void setDeleteFiles(String[] deleteFiles) {
        this.deleteFiles = deleteFiles;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "MovieDTO{" +
                "mNo='" + mNo + '\'' +
                ", regDate='" + regDate + '\'' +
                ", mTitle='" + mTitle + '\'' +
                ", director='" + director + '\'' +
                ", actor='" + actor + '\'' +
                ", category='" + category + '\'' +
                ", runningTime=" + runningTime +
                ", openDate='" + openDate + '\'' +
                ", grade='" + grade + '\'' +
                ", introduction='" + introduction + '\'' +
                ", insertFiles=" + Arrays.toString(insertFiles) +
                ", deleteFiles=" + Arrays.toString(deleteFiles) +
                ", fileName='" + fileName + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MovieDTO movieDTO = (MovieDTO) o;
        return Objects.equals(mNo, movieDTO.mNo) && Objects.equals(mTitle, movieDTO.mTitle);
    }

    @Override
    public int hashCode() {
        return Objects.hash(mNo, mTitle);
    }
}
