package com.stackuncontrol.entities;

public class PostAns {

    private int postid;
    private String postDetail;
    private String postuname;
    private String ranQueid;
    private String ranPostid;
    private String time;

    public PostAns() {
    }

    public PostAns(int postid, String postDetail, String postuname, String ranQueid, String ranPostid, String time) {
        this.postid = postid;
        this.postDetail = postDetail;
        this.postuname = postuname;
        this.ranQueid = ranQueid;
        this.ranPostid = ranPostid;
        this.time = time;
    }

    public PostAns(String postDetail, String postuname, String ranQueid, String ranPostid) {
        this.postDetail = postDetail;
        this.postuname = postuname;
        this.ranQueid = ranQueid;
        this.ranPostid = ranPostid;
    }

    public String getRanPostid() {
        return ranPostid;
    }

    public void setRanPostid(String ranPostid) {
        this.ranPostid = ranPostid;
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

    public String getPostuname() {
        return postuname;
    }

    public void setPostuname(String postuname) {
        this.postuname = postuname;
    }

    public String getRanQueid() {
        return ranQueid;
    }

    public void setRanQueid(String ranQueid) {
        this.ranQueid = ranQueid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

}
