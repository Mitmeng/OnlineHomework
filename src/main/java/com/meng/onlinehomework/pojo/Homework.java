package com.meng.onlinehomework.pojo;

import java.io.Serializable;

public class Homework implements Serializable {
    private Integer id;

    private String courseid;

    private String coursename;

    private String title;

    private String content;

    private Integer homeworktype;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid == null ? null : courseid.trim();
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getHomeworktype() {
        return homeworktype;
    }

    public void setHomeworktype(Integer homeworktype) {
        this.homeworktype = homeworktype;
    }
}