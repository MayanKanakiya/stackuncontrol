package com.stackuncontrol.entities;

public class FetchUData {

    private String uname;
    private String email;
    private String aboutme;

    public FetchUData() {
    }

    public FetchUData(String uname, String email, String aboutme) {
        this.uname = uname;
        this.email = email;
        this.aboutme = aboutme;
    }

    public String getUname() {
        return uname;
    }

    public String getEmail() {
        return email;
    }

    public String getAboutme() {
        return aboutme;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

}
