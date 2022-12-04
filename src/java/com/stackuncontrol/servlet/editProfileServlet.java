package com.stackuncontrol.servlet;

import com.stackuncontrol.db.UserDB;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.User;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class editProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String uname = req.getParameter("uname");
        String aboutme = req.getParameter("aboutme");

        HttpSession usreActive = req.getSession();
        User userActive = (User) usreActive.getAttribute("userActive");

        userActive.setUname(uname);
        userActive.setAboutme(aboutme);

        Connection conObj = DBConnection.isConnection();
        Message msgObj;
        HttpSession msgSession = req.getSession();

        UserDB userDB = new UserDB(conObj);
        if (conObj != null) {
            if (userDB.editProfile(userActive) == true) {
  msgObj = new Message("Your profile updated successfully.", "Success:", "alert-success", "fa fa-check-circle");
            msgSession.setAttribute("editProfilMsg", msgObj);
            res.sendRedirect("userProfile.jsp");
            } else {
  msgObj = new Message("Your profile not updated.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            msgSession.setAttribute("editProfilMsg", msgObj);
            res.sendRedirect("userProfile.jsp");
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            msgSession.setAttribute("editProfilMsg", msgObj);
            res.sendRedirect("userProfile.jsp");
        }
    }
}
