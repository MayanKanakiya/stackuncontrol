package com.stackuncontrol.servlet;

import com.stackuncontrol.db.askQuestionDao;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.User;
import com.stackuncontrol.entities.askQuestion;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class editQAServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String editTitle = req.getParameter("editTitle");
        ServletContext sc = getServletContext();
        String ranqueid = (String) sc.getAttribute("ranqueid");
        String editQuestionDetails = req.getParameter("editQuestionDetails");

        Connection conObj = DBConnection.isConnection();

        Message msgObj;
        HttpSession msgSession = req.getSession();

        askQuestionDao dao = new askQuestionDao(conObj);
        askQuestion aQuestion = new askQuestion();

        aQuestion.setTitle(editTitle);
        aQuestion.setDetailsque(editQuestionDetails);

//        insert revisions question and answer - start here
        HttpSession userActiveId = req.getSession();
        User uid = (User) userActiveId.getAttribute("userActive");
        String ReplaceEditQuestionDetails = editQuestionDetails.replace("'", "\\'");
        askQuestion aQuestion1 = new askQuestion(ReplaceEditQuestionDetails, uid.getUname(), ranqueid);
        try {
            if (conObj != null) {
                if (dao.revisionsQue(aQuestion1) != true) {
                    System.out.println("Error while insert revisions data into table(inside if block)");
                }
            } else {
                System.out.println("Connection Error.");
            }
        } catch (Exception e) {
            System.out.println(e + " Error while insert revisions data into table(inside catch block) ");
        }
//        insert revisions question and answer - end here

        if (conObj != null) {
            if (dao.updateQue(aQuestion, ranqueid) == true) {
                msgObj = new Message("Question updated successfully " + "<a href='discussion.jsp?que=" + ranqueid + "' class='alert-link text-primary'>Redirect discussion page</a>", "Success:", "alert-success", "fa fa-check-circle");
                msgSession.setAttribute("editQueMsg", msgObj);
                res.sendRedirect("edit.jsp?que=" + ranqueid);
            } else {
                msgObj = new Message("Question not updated. try again.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                msgSession.setAttribute("editQueMsg", msgObj);
                res.sendRedirect("edit.jsp?que=" + ranqueid);
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            msgSession.setAttribute("editQueMsg", msgObj);
            res.sendRedirect("edit.jsp?que=" + ranqueid);
        }
        sc.removeAttribute(ranqueid);
    }
}
