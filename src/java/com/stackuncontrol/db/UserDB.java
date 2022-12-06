package com.stackuncontrol.db;

import com.stackuncontrol.entities.User;
import com.stackuncontrol.entities.UserContact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDB {

    private Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Statement statement;

    public UserDB(Connection con) {
        this.con = con;
    }

//    Method for insert UserContact details into UserContact database - start here
    public boolean saveContactDetails(UserContact userContact) {
        boolean f = false;
        try {
            if (con != null) {
                String insertQuery = "insert into contact(name,email,cno,description) values('" + userContact.getName() + "','" + userContact.getEmail() + "','" + userContact.getCno() + "','" + userContact.getDesc() + "')";
                pst = con.prepareStatement(insertQuery);
                pst.executeUpdate();
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e + "Error while store user contact details into database");
        }
        return f;
    }
//    Method for insert UserContact details into UserContact database - end here

//    Method for prevent duplicate username - start code here
    public boolean checkUname(User user) {
        boolean f = false;
        try {
            String selectQuery = "select * from signup where username='" + user.getUname() + "'";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e + " Duplicate username found");
        }
        return f;
    }
//    Method for prevent duplicate username - end code here

//    Method for prevent duplicate email - start code here
    public boolean checkEmail(User user) {
        boolean f = false;
        try {
            String selectQuery = "select * from signup where email='" + user.getEmail() + "'";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e + " Duplicate email found");
        }
        return f;
    }
//    Method for prevent duplicate email - end code here

//    Method for user signup - start here
    public String signupUser(User user) {
        String f = "";
        try {
            if (con != null) {
                if (checkUname(user) != true && !user.getUname().equals("admin") && !user.getUname().equals("Admin")) {
                    if (checkEmail(user) != true) {
                        if (user.getPass().equals(user.getRe_pass())) {
                            String insertQuery = "insert into signup(username,email,pass) values('" + user.getUname() + "','" + user.getEmail() + "','" + user.getPass() + "');";
                            pst = con.prepareStatement(insertQuery);
                            pst.executeUpdate();
                        } else {
                            f = "errorUser";
                        }
                    } else {
                        f = "duplicateEmail";
                    }
                } else {
                    f = "duplicateUser";
                }
            }
        } catch (Exception e) {
            System.out.println(e + " Error while user signup");
        }
        return f;
    }
//    Method for user signup - end here

//    Method for user signin - start here
    public User signinUser(String email, String password) {
        User user = null;
        try {
            String selectQuery = "select * from signup where email='" + email + "' and pass=" + password + ";";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUname(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setAboutme(rs.getString("aboutme"));
                user.setId(Integer.toString(rs.getInt("userid")));
            }
        } catch (Exception e) {
            System.out.println(e + " Error while user signin");
        }
        return user;
    }
//    Method for user signin - end here

//    Method for update the user profile - start here
    public boolean editProfile(User user) {
        boolean f = false;
        try {
            if (con != null) {
                String updateQuery = "update signup set username='" + user.getUname() + "',aboutme='" + user.getAboutme() + "' where email='" + user.getEmail()+ "';";
                pst = con.prepareStatement(updateQuery);
                pst.executeUpdate();
                f=true;
            } else {
                f = false;
            }
        } catch (Exception e) {
            System.out.println(e + " Error while update user profile");
        }
        return f;
    }
//    Method for update the user profile - end here
}
