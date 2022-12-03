package com.stackuncontrol.entities;

public class UserSignin {

    private String email;
    private String pass;

    public UserSignin() {
    }

    public UserSignin(String email, String pass) {
        this.email = email;
        this.pass = pass;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

}
