package com.stackuncontrol.entities;

public class User {

    private String id;
    private String uname;
    private String email;
    private String pass;
    private String re_pass;
    private String aboutme;

    public User() {
    }

    public User(String uname, String email, String pass, String re_pass) {
        this.uname = uname;
        this.email = email;
        this.pass = pass;
        this.re_pass = re_pass;
    }

    public String getUname() {
        return uname;
    }

    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

    public String getRe_pass() {
        return re_pass;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setRe_pass(String re_pass) {
        this.re_pass = re_pass;
    }

    public String getAboutme() {
        return aboutme;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

}
