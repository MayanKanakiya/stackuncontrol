<%-- 
    Document   : discussion
    Created on : Dec 16, 2022, 10:38:23 AM
    Author     : Dell
--%>
<%@page import="com.stackuncontrol.entities.askQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.stackuncontrol.helper.dbconnection.DBConnection"%>
<%@page import="com.stackuncontrol.db.askQuestionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Discussion</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keyword" content="Question and answer for topic computer programming language.">
        <meta name="description" content="Stack Uncontrol is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers." >
        <link rel="shortcut icon" href="mediaFiles/favicon.ico" type="image/x-icon">
        <link href="css/bootStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles_utility.css" rel="stylesheet" type="text/css"/>
        <link href="css/mediaQuery.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="node_modules/@stackoverflow/stacks-editor/dist/styles.css" />
        <link href="css/stacks.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@ include file="navbar_footer/navbar.jsp" %>
        <%
             String str="";
            if (request.getParameter("que") != null) {
                str = request. getParameter("que");
            }
            askQuestionDao dao = new askQuestionDao(DBConnection.isConnection());
            ArrayList<askQuestion> list1 =  dao.discussion(str);
        %>
        <!--section 2 start here-->
        <div class="container my-5">
            <%
               if(list1.isEmpty()){
            %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading my-4">Someting went wrong!</h4>
                <p class="mb-4"><i class="fa fa-exclamation-triangle me-1" aria-hidden="true"></i>This question is not available.</p>
            </div>
            <%
              }else{
            %>
            <div class="d-flex mb-1">
                <%       
                          for(askQuestion aQuestion : list1){
                %>
                <div class="p-1"> <h1 class="mb-0"><%= aQuestion.getTitle() %></h1></div>
                <div class="ms-auto p-1"><a href="askQuestions.jsp" class="btn btn-primary btnAnimation">Ask question</a></div>
            </div>
            <p>Asked <strong><%= aQuestion.getTime()  %></strong> | Like <strong>1</strong></p>
            <hr>
            <div class="d-flex">
                <div class="flex-shrink-0">
                    <!--<i class="fa fa-thumbs-up me-1" aria-hidden="true" style="font-size:56px;cursor: pointer;"></i>-->
                    <i class="fa fa-thumbs-o-up me-1" aria-hidden="true" style="font-size:56px;cursor: pointer;"></i>
                    <p class="text-center" style="font-size: 20px;">0</p>
                </div>
                <div class="flex-grow-1 ms-3">
                    <p>
                        <%= aQuestion.getDetailsque()%>
                    </p>

                    <div class="d-flex justify-content-between">
                        <div class="p-2 flex-fill"><i class="fa fa-pencil me-1" aria-hidden="true"></i>Edit</div>
                        <div class="p-2">     
                            <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2"><%= aQuestion.getUname() %>
                        </div>
                    </div>
                </div>
                <%
                    }
                    }
                %>
            </div>
        </div>
        <!--section 2 end here-->

        <!--section 3 start here-->

        <!--section 3 end here-->

        <!--section 4 start here-->
        <div class="container">
            <hr>
            <h2>Your Answer:</h2>
        </div>
        <!--section 4 end here-->

        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
    </body>
</html>
