package com.stackuncontrol.entities;
public class askQuestion {
    private int queid;
    private String title;
    private String detailsque;
    private int userid;
    private String uname;
    private String ranQueId;
    private String time;

    public askQuestion() {
    }

    public askQuestion(String title, String detailsque, int userid,String ranQueId) {
        this.title = title;
        this.detailsque = detailsque;
        this.userid = userid;
        this.ranQueId = ranQueId;
    }

    public askQuestion(int queid, String title, String detailsque, int userid, String uname, String time,String ranQueId) {
        this.queid = queid;
        this.title = title;
        this.detailsque = detailsque;
        this.userid = userid;
        this.uname = uname;
        this.time = time;
        this.ranQueId = ranQueId;
    }

    public String getRanQueId() {
        return ranQueId;
    }

    public void setRanQueId(String ranQueId) {
        this.ranQueId= ranQueId;
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

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getQueid() {
        return queid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getTitle() {
        return title;
    }

    public String getDetailsque() {
        return detailsque;
    }

    public int getUserid() {
        return userid;
    }
    
}
