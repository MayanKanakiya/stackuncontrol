package com.stackuncontrol.servlet;

import com.mysql.cj.Session;
import com.stackuncontrol.db.UserDB;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.UserContact;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class contactServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");

        String contact_name = req.getParameter("contact_name");
        String contact_email = req.getParameter("contact_email");
        String contact_cno = req.getParameter("contact_cno");
        String contact_desc = req.getParameter("contact_desc");

        UserDB obj = new UserDB(DBConnection.isConnection());
        UserContact userContact = new UserContact(contact_name, contact_email, contact_cno, contact_desc);

        Connection conObj = DBConnection.isConnection();
        Message msgObj;
        HttpSession contactSession = req.getSession();
        if (conObj != null) {
            if (obj.saveContactDetails(userContact) == true) {
                msgObj = new Message("Thank you for connect with us.", "Success:", "alert-success", "fa fa-check-circle");
                contactSession.setAttribute("contactMsg", msgObj);
                res.sendRedirect("contact.jsp");

            } else {
                msgObj = new Message("Error while send your contact details.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                contactSession.setAttribute("contactMsg", msgObj);
                res.sendRedirect("contact.jsp");
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            contactSession.setAttribute("contactMsg", msgObj);
            res.sendRedirect("contact.jsp");
        }
    }

}
