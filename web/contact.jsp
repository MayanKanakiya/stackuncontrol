<%--
    Document   : contact
    Created on : Nov 4, 2022, 2:06:09 PM
    Author     : Dell
--%>

<%@page import="com.stackuncontrol.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Contact us</title>
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
        <%@ include file="navbar_footer/navbar.jsp"%>
        <div class="container p-3 contact-m-left-right">
            <div class="row p-3 shadow-lg mb-5" style='border-radius: 20px;'>
                <div class="col" id="contactImgRemove">
                    <img src="mediaFiles/contactus2.png" class="card-img-top" alt="contact image not found">
                </div>
                <div class="col">
                    <h1 class="mb-4">Feel free to contact us:</h1>
                    <!--Alert start-->
                    <%
                        Message msgObj = (Message) session.getAttribute("contactMsg");
                        if (msgObj != null) {
                    %>
                    <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                        <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i><%= msgObj.getType()%></strong> <%= msgObj.getContent()%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                            session.removeAttribute("contactMsg");
                        }
                    %>
                    <!--Alert End-->
                    <form id="mainContactForm" method="POST" action="contactServlet">
                        <div class="mb-3 form-floating">
                            <input type="text" class="form-control" id="name" name="contact_name" placeholder=" " autocomplete="off">
                            <label for="name" class="form-label">Name</label>
                        </div>
                        <div class="mb-3 form-floating">
                            <input type="email" class="form-control" id="email" name="contact_email" placeholder=" " autocomplete="off">
                            <label for="email" class="form-label">Email</label>
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="mb-3 form-floating">
                            <input type="text" class="form-control" id="cno" name="contact_cno" placeholder=" " autocomplete="off">
                            <label for="cno" class="form-label">Contact No</label>
                        </div>
                        <div class="mb-3 form-floating">
                            <textarea class="form-control" id="desc" name="contact_desc" placeholder=" " style="height: 150px"></textarea>
                            <label for="desc" class="form-label">Description</label>
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary btnAnimation" type="submit" id="contactBtn" disabled='disabled'>Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="navbar_footer/footer.html" %>
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/contactPage.js" defer type="text/javascript"></script>
    </body>
</html>
