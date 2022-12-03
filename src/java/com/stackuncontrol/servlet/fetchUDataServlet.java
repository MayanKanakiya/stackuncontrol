package com.stackuncontrol.servlet;

import com.stackuncontrol.db.UserDB;
import com.stackuncontrol.entities.FetchUData;
import com.stackuncontrol.helper.dbconnection.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class fetchUDataServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");

        Connection conObj = DBConnection.isConnection();
        UserDB userDB = new UserDB(conObj);

        HttpSession session = req.getSession();
        try {
            String userActive = (String) session.getAttribute("userActive");
            FetchUData fetchUData = userDB.fetchUser(userActive);
            req.setAttribute("user", fetchUData);
            req.getRequestDispatcher("/userProfile.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
