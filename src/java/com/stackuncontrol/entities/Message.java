package com.stackuncontrol.entities;

public class Message {

    private String content; //content
    private String type; // Success, Error
    private String cls; //alert-success or alert-danger
    private String sign; //success or error icon sign

    public Message(String content, String type, String cls, String sign) {
        this.content = content;
        this.type = type;
        this.cls = cls;
        this.sign = sign;
    }

    public Message() {
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getSign() {
        return sign;
    }

    public String getContent() {
        return content;
    }

    public String getType() {
        return type;
    }

    public String getCls() {
        return cls;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setCls(String cls) {
        this.cls = cls;
    }

}
