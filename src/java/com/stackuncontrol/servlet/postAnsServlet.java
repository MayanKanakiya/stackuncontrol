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

public class postAnsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
//        get the post ans details column - start code
        String detailsTxt = req.getParameter("postAns");
        String replaceDetailsTxt = detailsTxt.replace("'", "\\'");
//        get the post ans details column - end code

//        get the post postuid and postuname column - start code
        HttpSession userActiveId = req.getSession();
        User uid = (User) userActiveId.getAttribute("userActive");
//        get the post postuid and postunam column - end code

//        get the post queid column - start code
        ServletContext scRandQueId = getServletContext();
        String randQueid = (String) scRandQueId.getAttribute("ranQueid");
//        get the post queid column - end code

        String ranPostId = askQuestionServlet.getAlphaNumericString();

        Connection conObj = DBConnection.isConnection();
        askQuestionDao dao = new askQuestionDao(conObj);
        PostAns pans = new PostAns(replaceDetailsTxt, uid.getUname(), randQueid, ranPostId);
        Message msgObj;
        HttpSession postAnsSession = req.getSession();

        if (conObj != null) {
            if (dao.insertPost(pans) == true) {
                msgObj = new Message("Your post  added successfully.", "Success:", "alert-success", "fa fa-check-circle");
                postAnsSession.setAttribute("postAnsMsg", msgObj);
                res.sendRedirect("discussion.jsp?que=" + randQueid);
            } else {
                msgObj = new Message("Your post  not added, something went wrong.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
                postAnsSession.setAttribute("postAnsMsg", msgObj);
                res.sendRedirect("discussion.jsp?que=" + randQueid);
            }
        } else {
            msgObj = new Message("Connection Error.", "Error:", "alert-danger", "fa fa-exclamation-triangle");
            postAnsSession.setAttribute("postAnsMsg", msgObj);
            res.sendRedirect("discussion.jsp?que=" + randQueid);
        }
        scRandQueId.removeAttribute("ranQueid");
    }
    // function to generate a random string of length n

    static String getAlphaNumericString() {

        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(5);

        for (int i = 0; i < 5; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }
}
