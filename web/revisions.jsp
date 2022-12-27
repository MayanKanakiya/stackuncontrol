<%-- 
    Document   : revisions
    Created on : Dec 27, 2022, 8:07:50 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.stackuncontrol.entities.askQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.stackuncontrol.helper.dbconnection.DBConnection"%>
<%@page import="com.stackuncontrol.db.askQuestionDao"%>
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
        <!--main section start here-->
        <%
         String editQue = request.getParameter("que");
         askQuestionDao dao = new askQuestionDao(DBConnection.isConnection());
            ArrayList<askQuestion> list1 =  dao.fetchRevisionsData(editQue);
         if(user!=null){
           if(editQue!=null){
        %>
        <div class="container my-5">
            <!--part - 1 alert message start here-->
            <%
                for(askQuestion aQuestion : list1){
            %>
            <div class="alert alert-primary" role="alert">
                <div class="d-flex mb-3 align-items-center">
                    <div class="p-2">Added some correction in body.</div>
                    <div class="ms-auto p-2">
                        <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2">  <%=aQuestion.getUname()  %><p class="my-1">Asked <strong><%=aQuestion.getTime()  %></strong> | Like <strong>1</strong></p>
                    </div>
                </div>
            </div>
            <!--part - 1 alert message end  here-->
            <!--part - 2 correction start here-->
            <div class="RevisionsCodePalette">
                <%= aQuestion.getDetailsque() %>
            </div>
            <hr>
            <!--part - 2 correction end  here-->
            <%
                }
            %>
        </div>
        <%
       }else{
        %>
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading my-4">Someting went wrong!</h4>
            <p class="mb-4"><i class="fa fa-exclamation-triangle me-1" aria-hidden="true"></i>Data can't fetched.</p>
        </div>
        <%
        }
        }
        %>
        <!--main section end here-->
        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
    </body>
</html>
