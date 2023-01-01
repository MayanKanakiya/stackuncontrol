package com.stackuncontrol.servlet;

import com.stackuncontrol.db.askQuestionDao;
import com.stackuncontrol.entities.Message;
import com.stackuncontrol.entities.PostAns;
import com.stackuncontrol.entities.User;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class editPostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        ServletContext sc = getServletContext();
        String ranPostId = (String) sc.getAttribute("ranPostId");
        String ranQuetId = (String) sc.getAttribute("ranQueid");
        String editPostDetails = req.getParameter("editPostDetails");

        Connection conObj = DBConnection.isConnection();

        Message msgObj;
        HttpSession msgSession = req.getSession();

        askQuestionDao dao = new askQuestionDao(conObj);
        PostAns pans = new PostAns();
        pans.setPostDetail(editPostDetails);

        //        insert revisions post- start here
        HttpSession userActiveId = req.getSession();
        User uid = (User) userActiveId.getAttribute("userActive");
        String ReplaceEditPostDetails = editPostDetails.replace("'", "\\'");
        PostAns pans1 = new PostAns(ReplaceEditPostDetails, uid.getUname(), ranPostId);
        try {
            if (conObj != null) {
                if (dao.revisionsPost(pans1) != true) {
                    System.out.println("Error while insert edited post  revisions data into table(inside if block)");
                }
            } else {
                System.out.println("Connection Error.");
            }
        } catch (Exception e) {
            System.out.println(e + " Error while insert edited post revisions data into table(inside catch block) ");
        }
//        insert revisions post- end here

        if (conObj != null) {
            if (dao.updatePost(pans, ranPostId) == true) {
                msgObj = new Message("Question updated successfully " + "<a href='discussion.jsp?que=" + ranQuetId + "' class='alert-link text-primary'>Redirect discussion page</a>", "Success:", "alert-success", "fa fa-check-circle");
                msgSession.setAttribute("editPostMsg", msgObj);
                res.sendRedirect("edit.jsp?post=" + ranPostId);
            } else {
                msgObj = new Message("Question not updated. try again.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                msgSession.setAttribute("editPostMsg", msgObj);
                res.sendRedirect("edit.jsp?post=" + ranPostId);
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            msgSession.setAttribute("editPostMsg", msgObj);
            res.sendRedirect("edit.jsp?post=" + ranPostId);
        }
        sc.removeAttribute(ranPostId);
        sc.removeAttribute(ranQuetId);
    }
}
