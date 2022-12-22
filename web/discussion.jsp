<%-- 
    Document   : discussion
    Created on : Dec 16, 2022, 10:38:23 AM
    Author     : Dell
--%>
<%@page import="com.stackuncontrol.entities.askQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.stackuncontrol.helper.dbconnection.DBConnection"%>
<%@page import="com.stackuncontrol.db.askQuestionDao"%>
<%@page import="com.stackuncontrol.entities.Message"%>
<%@page import="com.stackuncontrol.entities.PostAns"%>
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
            ArrayList<PostAns> list2 =  dao.userPost(str);
        %>
        <!--section 2 start here-->
        <div class="container questionContainer my-5">
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
//                          send the queRandId in postAnsServlet servlet page - start code here
                                ServletContext scRandQueId = getServletContext();
                               scRandQueId.setAttribute("ranQueid", str);
//                          send the queRandId in postAnsServlet servlet page - end code here
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
                <div class="flex-grow-1 ms-3 codePalette">
                    <p>
                        <%= aQuestion.getDetailsque()%>
                    </p>

                    <div class="d-flex justify-content-between align-items-center">
                        <a style="color:black !important;" href="edit.jsp?que=<%=str %>"><i class="fa fa-pencil me-1" aria-hidden="true"></i>Edit</a>
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
        <!--section 4 start here-->
        <div class="container questionContainer my-5">
            <%
                       if(list2.isEmpty()){
            %>
            <div class="alert alert-info" role="alert">
                <h4 class="alert-heading my-4">User post not available on this question.</h4>
                <p class="mb-4">Know someone who can answer? Share a link to this question via <a target="_blank" href="https://mail.google.com/">email</a>, <a target="_blank" href="https://twitter.com">Twitter</a>, or <a target="_blank" href="https://facebook.com">Facebook</a>.</p>
            </div>
            <%
           }else{
                    for(PostAns pans : list2){
            %>
            <hr>
            <div class="d-flex">
                <div class="flex-shrink-0">
                    <!--<i class="fa fa-thumbs-up me-1" aria-hidden="true" style="font-size:56px;cursor: pointer;"></i>-->
                    <i class="fa fa-thumbs-o-up me-1" aria-hidden="true" style="font-size:56px;cursor: pointer;"></i>
                    <p class="text-center" style="font-size: 20px;">0</p>
                </div>
                <div class="flex-grow-1 ms-3 codePalette">
                    <p><%= pans.getPostDetail()%></p>
                    <div class="d-flex justify-content-between">
                      <a style="color:black !important;" href="edit.jsp?que=1"><i class="fa fa-pencil me-1" aria-hidden="true"></i>Edit</a>
                        <div class="p-2">     
                            <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2"> <%= pans.getPostuname()%> <p class="my-1">Asked <strong><%= pans.getTime()%></strong> | Like <strong>1</strong></p>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            <hr>
            <%
                }
            %>
        </div>
        <!--section 4 start here-->
        <!--section 3 start here-->
        <%
        if(user==null){
        %>
        <div class="container my-5 mb-5">
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading fw-bold my-4">You must be logged in to post your answer on Stack Uncontrol</h4>
                <p><a href="signin.jsp" style="text-decoration: none;">Sign in</a> or <a href="signup.jsp" style="text-decoration: none;">Sign up</a></p>
            </div>
        </div>
        <%
            }else{
                for(askQuestion aQuestion : list1){
                if(Integer.parseInt(user.getId())==aQuestion.getQueid()){
        %>
        <div class="container my-5 mb-5">
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading fw-bold my-4">You cannot able to answer on this question</h4>
                <p class="mb-4">Know someone who can answer? Share a link to this question via <a target="_blank" href="https://mail.google.com/">email</a>, <a target="_blank" href="https://twitter.com">Twitter</a>, or <a target="_blank" href="https://facebook.com">Facebook</a>.</p>
            </div>
        </div>
        <%
            }else{
        %>
        <div class="container">
            <hr>
            <!--alert message code start here-->
            <%
                         Message msgObj = (Message) session.getAttribute("postAnsMsg");
                          if (msgObj != null) {
            %>
            <!--alert code start here-->
            <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i></strong> <%= msgObj.getContent()%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                session.removeAttribute("postAnsMsg");
                }
            %>
            <!--alert code end here-->
            <!--alert message code end here-->
            <h2>Your Answer:</h2>
            <form id="postAnsMainForm" action="postAnsServlet" method="POST">
                <!--Ask question : ask question container start-->
                <div id="editor-example-1" class="mb-3"></div>
                <div id="preview1" class="d-none"></div>
                <input type="hidden" class="form-control mb-3 text-dark" name="postAns" id="txt1">
                <!--Ask question : ask question container end-->                

                <button type="submit" onclick="parseHTML()" id="postAnsBtn" disabled="disabled" class="btn btn-primary mb-4">Post your answer</button>
            </form>
        </div>
        <%
            }
            }
            }
        %>
        <!--section 3 end here-->
        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
        <script src="js/stacks.min.js" type="text/javascript"></script>
        <script src="js/postAns.js" type="text/javascript"></script>
    </body>
</html>
