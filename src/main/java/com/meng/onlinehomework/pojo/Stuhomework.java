package com.meng.onlinehomework.pojo;

import java.io.Serializable;

public class Stuhomework implements Serializable {
    private Integer id;

    private Integer homeworkid;

    private String homeworktitle;

    private Integer homeworktype;

    private String stuid;

    private String content;

    private Integer submits;

    private Integer score;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHomeworkid() {
        return homeworkid;
    }

    public void setHomeworkid(Integer homeworkid) {
        this.homeworkid = homeworkid;
    }

    public String getHomeworktitle() {
        return homeworktitle;
    }

    public void setHomeworktitle(String homeworktitle) {
        this.homeworktitle = homeworktitle == null ? null : homeworktitle.trim();
    }

    public Integer getHomeworktype() {
        return homeworktype;
    }

    public void setHomeworktype(Integer homeworktype) {
        this.homeworktype = homeworktype;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid == null ? null : stuid.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getSubmits() {
        return submits;
    }

    public void setSubmits(Integer submits) {
        this.submits = submits;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}