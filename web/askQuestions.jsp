<%--
    Document   : askQuestions
    Created on : Nov 17, 2022, 10:01:20 AM
    Author     : Dell
--%>
<%@page import="com.stackuncontrol.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Ask question</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keyword" content="Question and answer for topic computer programming language.">
        <meta name="description" content="Stack Uncontrol is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers." >
        <link rel="shortcut icon" href="mediaFiles/favicon.ico" type="image/x-icon">
        <!--stacks-editor link start here-->
        <link rel="stylesheet" href="node_modules/@stackoverflow/stacks-editor/dist/styles.css" />
        <link href="css/stacks.min.css" rel="stylesheet" type="text/css"/>
        <!--stacks-editor link start end-->
        <link href="css/bootStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles_utility.css" rel="stylesheet" type="text/css"/>
        <link href="css/mediaQuery.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@ include file="navbar_footer/navbar.jsp" %>
        <%
        if(user==null){
        %>
        <div class="container my-5 mb-5">
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading fw-bold my-4">You must be logged in to ask a question on Stack Uncontrol</h4>
                <p><a href="signin.jsp" style="text-decoration: none;">Sign in</a> or <a href="signup.jsp" style="text-decoration: none;">Sign up</a></p>
            </div>
        </div>
        <%
        }else{
        %>
        <div class="container my-4 mb-4">
            <h1 class="mb-3">Ask a public question</h1>
            <!--Ask question alert container start-->
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Writing a good question</h4>
                <p>You’re ready to ask a programming-related question and this form will help guide you through the process.

                    Looking to ask a non-programming question? See the topics here to find a relevant site.
                </p>
                <p class="mb-0">Steps:</p>
                <ul>
                    <li>Summarize your problem in a one-line title.</li>
                    <li>Describe your problem in more detail.</li>
                    <li>Describe what you tried and what you expected to happen.
                    </li>
                    <li>Review your question and post it to the site.</li>
                </ul>
            </div>
        </div>
        <!--Ask question alert container end-->

        <!--Ask question : title container start-->
        <div class="container">
            <!--alert message code start here-->
            <%
                         Message msgObj = (Message) session.getAttribute("askQueMsg");
                          if (msgObj != null) {
                   %>
                    <!--alert code start here-->
                    <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                        <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i></strong> <%= msgObj.getContent()%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        session.removeAttribute("askQueMsg");
                        }
                    %>
                    <!--alert code end here-->
            <!--alert message code end here-->
            <form id="askQuestionMainForm" action="askQuestionServlet" method="POST">
                <label for="title" class="form-label mb-0">Title</label>
                <div class="form-text my-0">Be specific and imagine you’re asking a question to another person. Minimum 20 characters.</div>
                <input type="text" class="form-control mb-3" id="title" name="title" placeholder="Enter title here">
                <!--Ask question : title container end-->

                <!--Ask question : ask question container start-->
                <label for="editor-example-1" class="form-label mb-0">What are the details of your problem and what your excepting ?</label>
                <div class="form-text my-0">Introduce the problem and expand on what you put in the title. Minimum 20 characters.</div>
                <div id="editor-example-1" class="mb-3"></div>
                <div id="preview1" class="d-none"></div>
                <input type="hidden" class="form-control mb-3 text-dark" name="detailsTxt" id="txt1">
                <!--Ask question : ask question container end-->

                <button type="submit" onclick="parseHTML()" id="questionBtn" disabled="disabled" class="btn btn-primary mb-4">Submit</button>
            </form>
        </div>
        <%
            }
        %>
        <%@ include file="navbar_footer/footer.html" %>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
        <script src="js/stacks.min.js" type="text/javascript"></script>
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/askQuestions.js" defer type="text/javascript"></script>
    </body>
</html>
