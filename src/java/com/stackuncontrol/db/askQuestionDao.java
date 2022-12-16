package com.stackuncontrol.db;

import com.stackuncontrol.entities.askQuestion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class askQuestionDao {

    private Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Statement statement;

    public askQuestionDao(Connection con) {
        this.con = con;
    }

    //Method for insert askQuestion inF database - start here
    public boolean askQuestion(askQuestion aQuestion) {
        boolean f = false;
        try {
            if (con != null) {
                String insertQuery = "insert into askquestion(title,detailsque,userid,ranqueid) values('" + aQuestion.getTitle() + "','" + aQuestion.getDetailsque() + "'," + aQuestion.getUserid() + ",'"+aQuestion.getRanQueId()+"');";
                pst = con.prepareStatement(insertQuery);
                pst.executeUpdate();
                f = true;
            }
        } catch (Exception e) {
            System.err.println(e + " Error while insert question into database ");
        }
        return f;
    }
    //Method for insert askQuestion in database - end here

//    Method for fetch question into questions.jsp page - start here
    public ArrayList<askQuestion> fetchQuestion() {
        ArrayList<askQuestion> list = new ArrayList<>();
        try {
            String selectQuery = "SELECT signup.userid,signup.username, askquestion.queid,askquestion.title,askquestion.detailsque,askquestion.ranqueid,askquestion.time FROM signup LEFT JOIN askquestion ON signup.userid = askquestion.userid;";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            while (rs.next()) {
                int queid = rs.getInt("queid");
                int userid = rs.getInt("userid");
                String queUname = rs.getString("username");
                String title = rs.getString("title");
                String detailsQue = rs.getString("detailsque");
                String ranqueid = rs.getString("ranqueid");
                String time = rs.getString("time");
                askQuestion aQuestion = new askQuestion(queid, title, detailsQue, userid, queUname, time,ranqueid);
                list.add(aQuestion);
            }
        } catch (Exception e) {
            System.err.println(e + " Error while fetch question into question.jsp page ");
        }
        return list;
    }

//    Method for fetch question into questions.jsp page - end here
}
