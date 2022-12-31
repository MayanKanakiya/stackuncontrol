package com.stackuncontrol.servlet;

import com.stackuncontrol.db.askQuestionDao;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class deleteQAServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String deleteQue = (String) req.getAttribute("deleteQue");

        Connection conObj = DBConnection.isConnection();
        askQuestionDao dao = new askQuestionDao(conObj);

        Message msgObj;
        HttpSession askQueMsgSes = req.getSession();
        if (conObj != null) {
            if (dao.DeleteQue(deleteQue) == true) {
               msgObj = new Message("Your question deleted successfully.", "Success:", "alert-success", "fa fa-check-circle");
                askQueMsgSes.setAttribute("delQueMsg", msgObj);
                res.sendRedirect("questions.jsp");
            } else {
                msgObj = new Message("Your question not deleted.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                askQueMsgSes.setAttribute("delQueMsg", msgObj);
                res.sendRedirect("discussion.jsp?que=" + deleteQue);
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            askQueMsgSes.setAttribute("delQueMsg", msgObj);
            res.sendRedirect("discussion.jsp?que=" + deleteQue);
        }
    }
}
