package com.meng.onlinehomework.pojo;

import java.io.Serializable;

public class Homeworklist implements Serializable {
    private Integer id;

    private String courseid;

    private String coursename;

    private String content;

    private String title;

    private Integer question1;

    private Integer question1type;

    private Integer question2;

    private Integer question2type;

    private Integer question3;

    private Integer question3type;

    private Integer question4;

    private Integer question4type;

    private Integer question5;

    private Integer question5type;

    private Integer count;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getQuestion1() {
        return question1;
    }

    public void setQuestion1(Integer question1) {
        this.question1 = question1;
    }

    public Integer getQuestion1type() {
        return question1type;
    }

    public void setQuestion1type(Integer question1type) {
        this.question1type = question1type;
    }

    public Integer getQuestion2() {
        return question2;
    }

    public void setQuestion2(Integer question2) {
        this.question2 = question2;
    }

    public Integer getQuestion2type() {
        return question2type;
    }

    public void setQuestion2type(Integer question2type) {
        this.question2type = question2type;
    }

    public Integer getQuestion3() {
        return question3;
    }

    public void setQuestion3(Integer question3) {
        this.question3 = question3;
    }

    public Integer getQuestion3type() {
        return question3type;
    }

    public void setQuestion3type(Integer question3type) {
        this.question3type = question3type;
    }

    public Integer getQuestion4() {
        return question4;
    }

    public void setQuestion4(Integer question4) {
        this.question4 = question4;
    }

    public Integer getQuestion4type() {
        return question4type;
    }

    public void setQuestion4type(Integer question4type) {
        this.question4type = question4type;
    }

    public Integer getQuestion5() {
        return question5;
    }

    public void setQuestion5(Integer question5) {
        this.question5 = question5;
    }

    public Integer getQuestion5type() {
        return question5type;
    }

    public void setQuestion5type(Integer question5type) {
        this.question5type = question5type;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}