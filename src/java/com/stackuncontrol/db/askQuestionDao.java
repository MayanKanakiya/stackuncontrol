package com.stackuncontrol.db;

import com.stackuncontrol.entities.PostAns;
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
                String insertQuery = "insert into askquestion(title,detailsque,userid,ranqueid) values('" + aQuestion.getTitle() + "','" + aQuestion.getDetailsque() + "'," + aQuestion.getUserid() + ",'" + aQuestion.getRanQueId() + "');";
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
                askQuestion aQuestion = new askQuestion(queid, title, detailsQue, userid, queUname, time, ranqueid);
                list.add(aQuestion);
            }
        } catch (Exception e) {
            System.err.println(e + " Error while fetch question into question.jsp page ");
        }
        return list;
//    Method for fetch question into questions.jsp page - end here
    }
//    Method for discussion question into other page - start here

    public ArrayList<askQuestion> discussion(String ranqueid) {
        ArrayList<askQuestion> list = new ArrayList<>();
        try {
            String selectQuery = "SELECT signup.userid,signup.username, askquestion.queid,askquestion.title,askquestion.detailsque,askquestion.ranqueid,askquestion.time FROM signup LEFT JOIN askquestion ON signup.userid = askquestion.userid WHERE askquestion.ranqueid='" + ranqueid + "';";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            while (rs.next()) {
                int queid = rs.getInt("queid");
                int userid = rs.getInt("userid");
                String queUname = rs.getString("username");
                String title = rs.getString("title");
                String detailsQue = rs.getString("detailsque");
                String time = rs.getString("time");
                askQuestion aQuestion = new askQuestion(queid, title, detailsQue, userid, queUname, time);
                list.add(aQuestion);
            }
        } catch (Exception e) {
            System.out.println(e + " Error while fetch the question into other page ");
        }
        return list;
    }
//    Method for discussion question into other page - end here

//    Method for insert postAns into post table - start code here
    public boolean insertPost(PostAns pans) {
        boolean f = false;
        try {
            if (con != null) {
                String insertQuery = "insert into post(postDetail,postuname,ranqueid) values('" + pans.getPostDetail() + "','" + pans.getPostuname() + "','" + pans.getRanQueid() + "');";
                pst = con.prepareStatement(insertQuery);
                pst.executeUpdate();
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e + " Error while insert post ans into table ");
        }
        return f;
    }
//    Method for insert postAns into post table - end code here

//    Method for fetch the user post into discusstion.jsp page - start code
    public ArrayList<PostAns> userPost(String ranqueid) {
        ArrayList<PostAns> list = new ArrayList<>();
        try {
            String selectQuery = "select * from post where ranqueid='" + ranqueid + "';";
            pst = con.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            while (rs.next()) {
                int postid = rs.getInt("postid");
                String postDetails = rs.getString("postDetail");
                String postuname = rs.getString("postuname");
                String postRanQueId = rs.getString("ranqueid");
                String time = rs.getString("time");
                PostAns pans = new PostAns(postid, postDetails, postuname, postRanQueId, time);
                list.add(pans);
            }
        } catch (Exception e) {
            System.out.println(e + " Error while fetch the user post into discusstion.jsp page ");
        }
        return list;
    }
//    Method for fetch the user post into discusstion.jsp page - end code
}
