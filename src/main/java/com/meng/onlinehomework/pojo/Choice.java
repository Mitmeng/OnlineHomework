package com.meng.onlinehomework.pojo;

import java.io.Serializable;

public class Choice implements Serializable {
    private Integer id;

    private Integer homeworkid;

    private Integer questionnumber;

    private String question;

    private String answera;

    private String answerb;

    private String answerc;

    private String answerd;

    private String answere;

    private String answerf;

    private String answerg;

    private Integer correctanswer;

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

    public Integer getQuestionnumber() {
        return questionnumber;
    }

    public void setQuestionnumber(Integer questionnumber) {
        this.questionnumber = questionnumber;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswera() {
        return answera;
    }

    public void setAnswera(String answera) {
        this.answera = answera == null ? null : answera.trim();
    }

    public String getAnswerb() {
        return answerb;
    }

    public void setAnswerb(String answerb) {
        this.answerb = answerb == null ? null : answerb.trim();
    }

    public String getAnswerc() {
        return answerc;
    }

    public void setAnswerc(String answerc) {
        this.answerc = answerc == null ? null : answerc.trim();
    }

    public String getAnswerd() {
        return answerd;
    }

    public void setAnswerd(String answerd) {
        this.answerd = answerd == null ? null : answerd.trim();
    }

    public String getAnswere() {
        return answere;
    }

    public void setAnswere(String answere) {
        this.answere = answere == null ? null : answere.trim();
    }

    public String getAnswerf() {
        return answerf;
    }

    public void setAnswerf(String answerf) {
        this.answerf = answerf == null ? null : answerf.trim();
    }

    public String getAnswerg() {
        return answerg;
    }

    public void setAnswerg(String answerg) {
        this.answerg = answerg == null ? null : answerg.trim();
    }

    public Integer getCorrectanswer() {
        return correctanswer;
    }

    public void setCorrectanswer(Integer correctanswer) {
        this.correctanswer = correctanswer;
    }
}