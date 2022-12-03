<%--
    Document   : signup
    Created on : Nov 6, 2022, 9:23:53 AM
    Author     : Dell
--%>
<%@page import="com.stackuncontrol.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Signup</title>
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
    <body style="background-color:rgb(203 226 255 / 16%)">
        <%@ include file="navbar_footer/navbar.jsp" %>
        <!--login form start-->
        <div class="container signup-m-left-right">
            <div class="row justify-content-center align-items-center my-5 mb-0">
                <div class="col-md-5 shadow-lg p-3 mb-1 bg-body" style="border-radius: 20px">
                    <h1 class="text-center text-secondary mb-3"><i class="fa fa-user-plus me-2" aria-hidden="true"></i>Sign up</h1>
                    <!--alert code start here-->
                    <%
                        Message msgObj = (Message) session.getAttribute("signupMsg");
                          if (msgObj != null) {
                    %>
                    <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                        <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i><%= msgObj.getType()%></strong> <%= msgObj.getContent()%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                            session.removeAttribute("signupMsg");
                        }
                    %>
                    <!--alert code end here-->
                    <form id="mainSignupForm" method="POST" action="signupServlet">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label for="uname" class="form-label">Display Name:</label>
                                <input type="text" class="form-control" id="uname" name="uname" placeholder="Display Name" autocomplete="off">
                            </div>
                            <div class="col-md-12">
                                <label for="fname" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" autocomplete="off">
                            </div>
                            <div class="col-md-12">
                                <label for="pass" class="form-label">Password:</label>
                                <input type="password" class="form-control" id="pass" name="pass" placeholder="Password">
                            </div>
                            <div class="col-md-12">
                                <label for="re-pass" class="form-label">Re-Enter Password:</label>
                                <input type="password" class="form-control" id="re-pass" name="re-pass" placeholder="Re-Enter Password">
                            </div>
                            <div class="d-grid gap-2 mb-2">
                                <button class="btn btn-primary btnAnimation" type="submit" id="signupBtn" disabled="disabled">SIGN UP</button>
                            </div>
                            <div class="separator text-center text-muted">OR SIGN UP WITH</div>
                            <div class="d-grid gap-2 col-6 mx-auto mb-4">
                                <button class="btn btn-light border" type="button"><i class="fa fa-google  me-2"></i>SIGN UP WITH GOOGLE</button>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="text-center my-4 mb-4"><b>Already have an account? <a href="signin.jsp">Sign in</a></b></p>
            </div>

        </div>
        <!--login form end-->
        <%@ include file="navbar_footer/footer.html" %>
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/signup.js" defer type="text/javascript"></script>
    </body>
</html>
