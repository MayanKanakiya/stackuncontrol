package com.stackuncontrol.db;

import com.stackuncontrol.entities.askQuestion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
                String insertQuery = "insert into askquestion(title,detailsque,exceptque,userid) values('"+aQuestion.getTitle()+"','"+aQuestion.getDetailsque()+"','"+aQuestion.getExceptque()+"','"+aQuestion.getUserid()+"');";
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
    public askQuestion fetchQuestion(){
        askQuestion aQuestion=null;
        try {
             String selectQuery = "select * from askquestion";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                aQuestion = new askQuestion();
                aQuestion.setQueid(rs.getInt("queid"));
                aQuestion.setTitle(rs.getString("title"));
                aQuestion.setDetailsque(rs.getString("detailsque"));
                aQuestion.setExceptque(rs.getString("exceptque"));
                aQuestion.setUserid(rs.getInt("userid"));
                aQuestion.setTime(rs.getString("time"));
            }
        } catch (Exception e) {
            System.err.println(e+" Error while fetch question into question.jsp page ");
        }
        return aQuestion;
    }
    
//    Method for fetch question into questions.jsp page - end here
}
