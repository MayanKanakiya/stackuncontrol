package com.stackuncontrol.entities;
public class askQuestion {
    private int queid;
    private String title;
    private String detailsque;
    private String exceptque;
    private int userid;
    private String time;

    public askQuestion() {
    }

    public askQuestion(String title, String detailsque, String exceptque, int userid) {
        this.title = title;
        this.detailsque = detailsque;
        this.exceptque = exceptque;
        this.userid = userid;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTime() {
        return time;
    }

    public void setQueid(int queid) {
        this.queid = queid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDetailsque(String detailsque) {
        this.detailsque = detailsque;
    }

    public void setExceptque(String exceptque) {
        this.exceptque = exceptque;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getQueid() {
        return queid;
    }

    public String getTitle() {
        return title;
    }

    public String getDetailsque() {
        return detailsque;
    }

    public String getExceptque() {
        return exceptque;
    }

    public int getUserid() {
        return userid;
    }
    
}
