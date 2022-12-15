package com.stackuncontrol.servlet;

import com.stackuncontrol.db.askQuestionDao;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.User;
import com.stackuncontrol.entities.askQuestion;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class askQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        try {
            String title = req.getParameter("title");
            String detailsTxt = req.getParameter("detailsTxt");
            String replaceDetailsTxt = detailsTxt.replace("'", "\\'");

            HttpSession userActiveId = req.getSession();
            User uid = (User) userActiveId.getAttribute("userActive");

            Connection conObj = DBConnection.isConnection();
            askQuestionDao dao = new askQuestionDao(conObj);
            askQuestion aQuestion = new askQuestion(title, replaceDetailsTxt, Integer.parseInt(uid.getId()));

            Message msgObj;
            HttpSession askQueMsgSes = req.getSession();

            if (conObj != null) {
                if (dao.askQuestion(aQuestion) == true) {
                    res.sendRedirect("questions.jsp");
                } else {
                    msgObj = new Message("Your question not add.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                    askQueMsgSes.setAttribute("askQueMsg", msgObj);
                    res.sendRedirect("askQuestions.jsp");
                }
            } else {
                msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                askQueMsgSes.setAttribute("askQueMsg", msgObj);
                res.sendRedirect("askQuestion.jsp");
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}
