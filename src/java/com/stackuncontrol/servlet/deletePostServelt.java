package com.stackuncontrol.servlet;

import com.stackuncontrol.db.askQuestionDao;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class deletePostServelt extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String deletePost = (String) req.getAttribute("deletePost");
        ServletContext sc = getServletContext();
        String ranQuetId = (String) sc.getAttribute("ranQueid");

        Connection conObj = DBConnection.isConnection();
       askQuestionDao dao = new askQuestionDao(conObj);

        Message msgObj;
        HttpSession askQueMsgSes = req.getSession();
        if (conObj != null) {
            if (dao.DeletePost(deletePost) == true) {
               msgObj = new Message("Your post deleted successfully.", "Success:", "alert-success", "fa fa-check-circle");
                askQueMsgSes.setAttribute("delPostMsg", msgObj);
                res.sendRedirect("discussion.jsp?que=" + ranQuetId);
            } else {
                msgObj = new Message("Your post not deleted.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                askQueMsgSes.setAttribute("delPostMsg", msgObj);
                res.sendRedirect("discussion.jsp?que=" + ranQuetId);
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            askQueMsgSes.setAttribute("delPostMsg", msgObj);
            res.sendRedirect("discussion.jsp?que=" + ranQuetId);
        }
    }
}
