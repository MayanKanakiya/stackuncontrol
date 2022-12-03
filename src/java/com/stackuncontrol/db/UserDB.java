package com.stackuncontrol.db;

import com.stackuncontrol.entities.FetchUData;
import java.sql.PreparedStatement;
import java.sql.Connection;
import com.stackuncontrol.entities.UserContact;
import com.stackuncontrol.entities.UserSignin;
import com.stackuncontrol.entities.UserSignup;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
    public boolean checkUname(UserSignup userSignup) {
        boolean f = false;
        try {
            String selectQuery = "select * from signup where username='" + userSignup.getUname() + "'";
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
    public boolean checkEmail(UserSignup userSignup) {
        boolean f = false;
        try {
            String selectQuery = "select * from signup where email='" + userSignup.getEmail() + "'";
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
    public String signupUser(UserSignup userSignup) {
        String f = "";
        try {
            if (con != null) {
                if (checkUname(userSignup) != true && !userSignup.getUname().equals("admin") && !userSignup.getUname().equals("Admin")) {
                    if (checkEmail(userSignup) != true) {
                        if (userSignup.getPass().equals(userSignup.getRe_pass())) {
                            String insertQuery = "insert into signup(username,email,pass) values('" + userSignup.getUname() + "','" + userSignup.getEmail() + "','" + userSignup.getPass() + "');";
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
    public String signinUser(UserSignin userSignin) {
        String f = "";
        try {
            String selectQuery = "select username from signup where email='" + userSignin.getEmail() + "' and pass=" + userSignin.getPass() + ";";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                f = rs.getString("username");
            }
        } catch (Exception e) {
            System.out.println(e + " Error while user signin");
        }
        return f;
    }
//    Method for user signin - end here

//    Method for fetching the user data - start here
    public FetchUData fetchUser(String uname) {
        FetchUData fetchUData = new FetchUData();
        try {
            String selectQuery = "select * from signup where username='" + uname + "'";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                fetchUData.setUname(rs.getString("username"));
                fetchUData.setEmail(rs.getString("email"));
                fetchUData.setAboutme(rs.getString("aboutme"));
            }
        } catch (Exception e) {
            System.out.println(e + " Error while fetching user data");
        }
        return fetchUData;
//    Method for fetching the user data - end here
    }
}
