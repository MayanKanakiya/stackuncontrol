<%--
    Document   : userProfile
    Created on : Nov 8, 2022, 9:46:33 AM
    Author     : Dell
--%>
<%@page import="com.stackuncontrol.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Customize your profile</title>
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
        <%
        if(user==null){
            response.sendRedirect("questions.jsp");
        }else{
        %>
        <div class="container userProfile-m-left-right my-5 shadow-lg p-3 mb-5" style='border-radius: 25px;background-color: white;'>
            <!--userProfile header part start-->
            <div class="d-flex align-items-center userProfileMobile">
                <div class="">
                    <img src="mediaFiles/user.png" alt="user image not found" width="128" height="128" class="rounded-circle me-2">
                </div>
                <div class="userProfileUname">
                    <h1 class="mb-0"><%= user.getUname() %></h1>
                    <span class="mt-1"><%= user.getEmail() %></span>
                </div>
                <div class="ms-auto userProfileLogoutBtn">
                    <a class="btn btn-primary btnAnimation" href="logout.jsp">LOGOUT</a>
                </div>
            </div>

            <!--userProfile header part end-->
            <hr>
            <!--userProfile activity and edit profile section start-->
            <ul class="nav nav-pills bg-light my-3 shadow-sm p-3 mb-3 rounded" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link nav-link-custom me-3 active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Profile</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link nav-link-custom" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Activity</button>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                    <!--userProfile main form - 1 start-->
                    <h1>Edit your profile:</h1>
                    <!--alert message code - start here-->
                    <%
                     Message msgObj = (Message) session.getAttribute("editProfilMsg");
                     if (msgObj != null) {
                    %>
                    <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                        <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i><%= msgObj.getType()%></strong> <%= msgObj.getContent()%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                            session.removeAttribute("editProfilMsg");
                        }
                    %>
                    <!--alert message code - end here-->
                    <form id="userProfileForm-1" method="POST" action="editProfileServlet">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label for="dname" class="form-label">Display Name:</label>
                                <input type="text" class="form-control" id="uname" name="uname" placeholder="Display Name" value="<%= user.getUname() %>">
                            </div>
                            <div class="col-md-12">
                                <label for="aboutme" class="form-label">About Me:</label>
                                <textarea class="form-control" id="aboutme" name="aboutme" placeholder="Write about yourself" style="height: 150px"><%=(user.getAboutme().equals("Tell us about yourself")) ? "" : user.getAboutme() %></textarea>
                            </div>
                            <div class="d-grid gap-2 mb-2">
                                <button class="btn btn-primary" type="submit" id="saveProfileBtn" disabled="disabled">SAVE PROFILE</button>
                            </div>
                        </div>
                    </form>
                    <!--userProfile main form - 1 end-->
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel">
                    <!--question and answer section start-->
                    <h1 class="mb-3">Questions and Answer:</h1>
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <div class="col-md-6">
                            <div class="card userActivityCards">
                                <h4 class="card-header text-center">Questions</h4>
                                <div class="card-body">
                                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer text-center">
                                    Visit all questions
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card userActivityCards">
                                <h4 class="card-header text-center">Answer</h4>
                                <div class="card-body">
                                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer text-center">
                                    Visit all answers
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--question and answer section end-->
                    <!--Badges section start-->
                    <h1 class="my-4 mb-3">Badges:</h1>
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <div class="col-md-6">
                            <div class="card userActivityCards">
                                <h4 class="card-header text-center"> <img src="mediaFiles/goldMedel.png" alt="user image not ofund" width="45" height="50" class="rounded-circle me-2"></h4>
                                <div class="card-body">
                                    <p class="card-text">You don’t have a gold badge yet. Write an answer that scores 100 or more to earn your first.</p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn btn-primary">Browse questions</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card userActivityCards">
                                <h4 class="card-header text-center"> <img src="mediaFiles/sliverMedel.png" alt="user image not ofund" width="45" height="50" class="rounded-circle me-2"></h4>
                                <div class="card-body">
                                    <p class="card-text">You don’t have a silver badge yet. Ask a question that scores 25 or more to earn your first.</p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn btn-primary">Ask questions</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Badges section end-->
                </div>
            </div>
        </div>
        <%
                                }%>
        <!--userProfile activity and edit profile section end-->
        <%@ include file="navbar_footer/footer.html" %>
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/editProfile.js" type="text/javascript"></script>
    </body>
</html>
