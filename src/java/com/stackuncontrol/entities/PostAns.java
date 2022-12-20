package com.stackuncontrol.entities;

public class PostAns {

    private int postid;
    private String postDetail;
    private int postuid;
    private String postuname;
    private int queid;
    private String time;

    public PostAns() {
    }

    public PostAns(int postid, String postDetail, int postuid, String postuname, int queid, String time) {
        this.postid = postid;
        this.postDetail = postDetail;
        this.postuid = postuid;
        this.postuname = postuname;
        this.queid = queid;
        this.time = time;
    }

    public PostAns(String postDetail, int postuid, String postuname, int queid) {
        this.postDetail = postDetail;
        this.postuid = postuid;
        this.postuname = postuname;
        this.queid = queid;
    }
    

    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    public String getPostDetail() {
        return postDetail;
    }

    public void setPostDetail(String postDetail) {
        this.postDetail = postDetail;
    }

    public int getPostuid() {
        return postuid;
    }

    public void setPostuid(int postuid) {
        this.postuid = postuid;
    }

    public String getPostuname() {
        return postuname;
    }

    public void setPostuname(String postuname) {
        this.postuname = postuname;
    }

    public int getQueid() {
        return queid;
    }

    public void setQueid(int queid) {
        this.queid = queid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
}
