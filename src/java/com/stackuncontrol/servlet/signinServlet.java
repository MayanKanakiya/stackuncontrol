package com.stackuncontrol.servlet;

import com.stackuncontrol.db.UserDB;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.UserSignin;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class signinServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");

        String email = req.getParameter("email");
        String pass = req.getParameter("pass");

        UserDB obj = new UserDB(DBConnection.isConnection());
        UserSignin userSignin = new UserSignin(email, pass);

        Connection conObj = DBConnection.isConnection();
        Message msgObj;

        HttpSession signinSession = req.getSession();
        HttpSession userActive = req.getSession();

        if (conObj != null) {
            if (!obj.signinUser(userSignin).equals("")) {
                res.sendRedirect("questions.jsp");
                userActive.setAttribute("userActive", obj.signinUser(userSignin));

            } else {
                msgObj = new Message("Check your email or password", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                signinSession.setAttribute("signinMsg", msgObj);
                res.sendRedirect("signin.jsp");
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            signinSession.setAttribute("signinMsg", msgObj);
            res.sendRedirect("signin.jsp");
        }
    }

}
