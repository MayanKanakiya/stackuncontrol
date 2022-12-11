<%@page import="com.stackuncontrol.entities.User"%>
<!--Navbar Start-->
<nav class="navbar navbar-expand-lg navbar-light bg-white" id="mainNavbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp" id="logo">
            <img  src="mediaFiles/logo.png" alt="logo" width="180" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent" >
            <div class="d-flex">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item mainMenuList">
                        <span class="nav-link">
                            <a class="mainMenuLink"  aria-current="page" href="index.jsp">
                                <i class="fa fa-home me-1" aria-hidden="true"></i>Home</a>
                        </span>
                    </li>
                    <li class="nav-item mainMenuList">
                        <span class="nav-link"><a class="mainMenuLink" aria-current="page" href="about.jsp"><i class="fa fa-info-circle me-1" aria-hidden="true"></i>About us</a></span>
                    </li>
                    <li class="nav-item mainMenuList">
                        <span class="nav-link"><a class="mainMenuLink" aria-current="page" href="contact.jsp"><i class="fa fa-envelope me-1" aria-hidden="true"></i>Contact us</a></span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="collapse navbar-collapse flex-row-reverse" id="navbarSupportedContent" >
            <div class="d-flex">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item me-1">
                        <%
                            User user=(User)session.getAttribute("userActive");
                            if(user==null){
                        %>

                        <a href="signin.jsp" class="btn btn-primary btnAnimation"><i class="fa fa-sign-in me-1" aria-hidden="true"></i>Sign in</a>
                    </li>
                    <li class="me-1">
                        <a href="signup.jsp"  class="btn btn-primary btnAnimation"><i class="fa fa-user-plus me-1" aria-hidden="true"></i>Sign up</a>
                    </li>
                    <%
                        }else{
                    %>
                    <li class="nav-item dropdown removeDropdownIconInUserActive">
                        <a class="nav-link dropdown-toggle me-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="mediaFiles/user.png" alt="user image not ofund" width="32" height="32" class="rounded-circle">
                            <span class="text-dark"><%= user.getUname() %></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="userProfile.jsp">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                    <%
                    }
                    %>
                    <li>
                        <a href="questions.jsp" class="btn btn-primary btnAnimation"><i class="fa fa-question-circle me-1" aria-hidden="true"></i>question</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!--Navbar End-->

<!--mobile navbar start-->
<div class="d-flex flex-column flex-shrink-0 p-3 bg-light offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel" style="width: 280px;">
    <div class="d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="index.jsp" id="logo">
            <img  src="mediaFiles/logo.png" alt="logo" width="180" height="50">
        </a>
        <button type="button" class="btn-close" aria-label="Close" data-bs-dismiss="offcanvas"></button>
    </div>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item mainMenuList">
            <span class="nav-link">
                <a class="mainMenuLink"  aria-current="page" href="index.jsp">
                    <i class="fa fa-home me-1" aria-hidden="true"></i>Home</a>
            </span>
        </li>
        <li class="nav-item mainMenuList">
            <span class="nav-link"><a class="mainMenuLink" aria-current="page" href="about.jsp"><i class="fa fa-info-circle me-1" aria-hidden="true"></i>About us</a></span>
        </li>
        <li class="nav-item mainMenuList">
            <span class="nav-link"><a class="mainMenuLink" aria-current="page" href="contact.jsp"><i class="fa fa-envelope me-1" aria-hidden="true"></i>Contact us</a></span>
        </li>
        <%
            if(user==null){
        %>
        <li class="nav-item">
            <div class="d-grid col-12 ps-3 pe-3 py-2">
                <a class="btn btn-primary btnAnimation" href="signin.jsp"><i class="fa fa-sign-in me-1" aria-hidden="true"></i>Sign in</a>
            </div>
        </li>
        <li class="nav-item">
            <div class="d-grid col-12 ps-3 pe-3 py-2">
                <a class="btn btn-primary btnAnimation" href="signup.jsp"><i class="fa fa-user-plus me-1" aria-hidden="true"></i>Sign up</a>
            </div>
        </li>
        <%
            }
        %>
        <li class="nav-item">
            <div class="d-grid col-12 ps-3 pe-3 py-2">
                <a class="btn btn-primary btnAnimation" href="questions.jsp"><i class="fa fa-question-circle me-1" aria-hidden="true"></i>question</a>
            </div>
        </li>
    </ul>
    <%
        if(user!=null){
    %>
    <hr>
    <div class="dropdown removeDropdownIconInUserActive">
        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="mediaFiles/user.png" alt="user image not ofund" width="32" height="32" class="rounded-circle me-2">
            <strong><%= user.getUname() %></strong>
        </a>
        <ul class="dropdown-menu text-small shadow">
            <li><a class="dropdown-item" href="userProfile.jsp">Edit Profile</a></li>

            <li><a class="dropdown-item" href="logout.jsp">logout</a></li>
        </ul>
    </div>
    <%
        }
    %>
</div>
<script src="js/logic.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<!--animation navbar scroll script statr here-->
<script src="js/navbarAnimation.js" defer type="text/javascript"></script>
<!--mobile navbar end-->
