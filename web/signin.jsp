<%--
    Document   : signin
    Created on : Nov 6, 2022, 9:23:16 AM
    Author     : Dell
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="com.stackuncontrol.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.stackuncontrol.helper.dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Sign in</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keyword" content="Question and answer for topic computer programming language.">
        <meta name="description" content="Stack Uncontrol is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers." >
        <link rel="shortcut icon" href="mediaFiles/favicon.ico" type="image/x-icon">
        <link href="css/bootStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles_utility.css" rel="stylesheet" type="text/css"/>
        <link href="css/mediaQuery.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background-color: rgb(203 226 255 / 16%);">
        <%@ include file="navbar_footer/navbar.jsp" %>
        <!--login form start-->
        <div class="container signin-m-left-right" >
            <div class="row justify-content-center align-items-center my-5 mb-0">
                <div class="col-md-4 shadow-lg p-3 mb-1 bg-body" style="border-radius: 20px">
                    <h1 class="text-center text-secondary"><i class="fa fa-user me-2" aria-hidden="true"></i>Sign in</h1>
                    <h5 class="text-center text-secondary">Welcome Back!!</h5>
                    <%
                         Message msgObj = (Message) session.getAttribute("signinMsg");
                          if (msgObj != null) {
                   %>
                    <!--alert code start here-->
                    <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                        <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i></strong> <%= msgObj.getContent()%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        session.removeAttribute("signinMsg");
                        }
                    %>
                    <!--alert code end here-->

                    <form id="mainSigninForm" method="POST" action="signinServlet">
                        <div class="input-group my-4">
                            <div class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></div>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" autocomplete="off">
                        </div>
                        <div class="input-group my-4">
                            <div class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></div>
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Password">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberChk">
                            <label class="form-check-label" for="rememberChk">Remember Me</label>
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary" type="submit" id="signinBtn" disabled="disabled">SIGN IN</button>
                        </div>
                    </form>
                    <p class="text-center my-4 mb-2"><a class="forgotPasswordLink">Forgot Passoword ?</a></p>
                </div>
                <p class="text-center my-4 mb-4"><b>New to Stack Uncontrol? <a href="signup.jsp">Create an account.</a></b></p>
            </div>

        </div>
        <!--login form end-->
        <%@ include file="navbar_footer/footer.html" %>
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/signin.js" defer type="text/javascript"></script>
    </body>
</html>
