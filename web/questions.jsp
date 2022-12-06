<%--
    Document   : questions
    Created on : Nov 15, 2022, 8:54:01 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Questions</title>
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
    <body>
        <%@ include file="navbar_footer/navbar.jsp" %>
        <!--tags, questions and search bar section start-->
        <%
            askQuestion fetchedQue=(askQuestion)session.getAttribute("questionsFetched");
            if(fetchedQue==null){
               out.println("Something went wrong");
            }else{
        %>
        <div class="container">
            <div class="navbar bg-whitw">
                <div class="container-fluid">
                    <div class="navbar-brand">
                        <a class="btn btn-primary btnAnimation" href="tags.jsp">Tags</a>
                        <a class="btn btn-primary btnAnimation" href="askQuestions.jsp">Ask Question</a>
                    </div>
                    <form class="form">
                        <i class="fa fa-search"></i>
                        <input type="search" class="form-control form-input" placeholder="Search..">
                    </form>
                </div>
            </div>
        </div>
        <!--tags, questions and search bar section end-->

        <!--filter and total question text start-->
        <div class="container">
            <div class="navbar bg-whitw">
                <div class="container-fluid">
                    <div>
                        <p class="mb-0">1000 Questions</p>
                    </div>

                    <div class="navbar-brand dropstart">
                        <button class="btn btn-outline-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Number of rows</button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">25</a></li>
                            <li><a class="dropdown-item" href="#">75</a></li>
                            <li><a class="dropdown-item" href="#">100</a></li>
                            <li><a class="dropdown-item" href="#">Show all</a></li>
                        </ul>
                        <button class="btn btn-outline-primary btn-sm" type="button">Newest</button>
                        <button class="btn btn-outline-primary btn-sm" type="button">Unanswered</button>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <!--filter and total question text end-->
        <!--Questions section start-->
        <div class="container">
            <!--question-1 start-->
            <div class="row mb-0 mb-3">
                <div class="col-12">
                    <div class="d-flex align-items-center">
                        <!--answer counter start-->
                        <div class="flex-shrink-0">
                            <p class="mb-0 bg-light">1 answer</p>
                        </div>
                        <!--answer counter end-->
                        <div class="flex-grow-1 ms-3">
                            <a href="#" class="fw-bold fs-4 mb-1 questionLink">How can I validate an email address in JavaScript?</a>
                            <p class="fw-light fs-6">JavaScript, often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS. As of 2022, 98% of websites use JavaScript on the client side for webpage behavior, often incorporating third-party libraries</p>
                        </div>
                    </div>

                </div>
                <div class="col-12">
                    <div class="d-flex flex-row-reverse align-items-center">
                        <p class="mb-0 me-5">Mayank <span>, asked 17/11/2022 at 9:25PM</span></p>
                        <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2">
                    </div>
                </div>
            </div>
            <!--question-1 end-->
        </div>
        <!--Questions section end-->
        <%
            }
        %>
        <%@ include file="navbar_footer/footer.html" %>

        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
    </body>
</html>
