package com.stackuncontrol.servlet;

import com.stackuncontrol.db.UserDB;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.UserSignup;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class signupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String signup_uname = req.getParameter("uname");
        String signup_email = req.getParameter("email");
        String signup_pass = req.getParameter("pass");
        String signup_re_pass = req.getParameter("re-pass");

        UserDB obj = new UserDB(DBConnection.isConnection());
        UserSignup userSignup = new UserSignup(signup_uname, signup_email, signup_pass, signup_re_pass);

        Connection conObj = DBConnection.isConnection();
        Message msgObj;
        HttpSession signupSession = req.getSession();

        if (conObj != null) {
            if (!obj.signupUser(userSignup).equals("duplicateUser")) {
                if (!obj.signupUser(userSignup).equals("duplicateEmail")) {
                    if (!obj.signupUser(userSignup).equals("errorUser")) {
                        res.sendRedirect("signin.jsp");
                    } else {
                        msgObj = new Message("Password doesn't match.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                        signupSession.setAttribute("signupMsg", msgObj);
                        res.sendRedirect("signup.jsp");
                    }
                } else {
                    msgObj = new Message("Please enter unique email.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                    signupSession.setAttribute("signupMsg", msgObj);
                    res.sendRedirect("signup.jsp");
                }
            } else {
                msgObj = new Message("Please enter unique username.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                signupSession.setAttribute("signupMsg", msgObj);
                res.sendRedirect("signup.jsp");
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            signupSession.setAttribute("signupMsg", msgObj);
            res.sendRedirect("signup.jsp");
        }
    }
}
