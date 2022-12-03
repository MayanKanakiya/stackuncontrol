package com.stackuncontrol.entities;

public class UserContact {

    private String name;
    private String email;
    private String cno;
    private String desc;

    public UserContact(String name, String email, String cno, String desc) {
        this.name = name;
        this.email = email;
        this.cno = cno;
        this.desc = desc;
    }

    public UserContact() {
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getCno() {
        return cno;
    }

    public String getDesc() {
        return desc;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

}
