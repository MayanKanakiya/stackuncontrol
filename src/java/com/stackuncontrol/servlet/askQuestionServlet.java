package com.stackuncontrol.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class askQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        
        String title = req.getParameter("title");
        String txt1 = req.getParameter("txt1");
        String txt2 = req.getParameter("txt2");
        
        System.out.println(title);
        System.out.println(txt1);
        System.out.println(txt2);
    }
}
