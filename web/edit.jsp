<%-- 
    Document   : edit.jsp
    Created on : Dec 22, 2022, 8:33:22 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.stackuncontrol.entities.askQuestion"%>
<%@page import="com.stackuncontrol.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.stackuncontrol.helper.dbconnection.DBConnection"%>
<%@page import="com.stackuncontrol.db.askQuestionDao"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Edit</title>
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
        <div class="container my-5 mb-0">
            <div class="alert alert-warning" role="alert">
                <p>Your edit will be placed in a queue until it is peer reviewed.</p>
                <p>We welcome edits that make the post easier to understand and more valuable for readers. Because community members review edits, please try to make the post substantially better than how you found it, for example, by fixing grammar or adding additional resources and hyperlinks.</p>
            </div>
        </div>
        <%
            String editQue = request.getParameter("que");
            String delQue = request.getParameter("delque");
            String editPost = request.getParameter("post");
            String delPost = request.getParameter("delpost");
//            start if block when edit the question.
            if(user!=null){
            if(editQue!=null){
             askQuestionDao dao = new askQuestionDao(DBConnection.isConnection());
            ArrayList<askQuestion> list1 =  dao.fetchQuestion(editQue);
        %>
        <div class="container">
            <form id="editQAMainForm" action="editQAServlet" method="POST">
                <%
                ServletContext sc = getServletContext();
                sc.setAttribute("ranqueid", editQue);
                %>
                <%
                   if(list1.isEmpty()){
                %>
                <div class="alert alert-danger" role="alert">
                    <h4 class="alert-heading my-4">Someting went wrong!</h4>
                    <p class="mb-4"><i class="fa fa-exclamation-triangle me-1" aria-hidden="true"></i>This question is not available.</p>
                </div>
                <%
                    }else{
                      for(askQuestion aQuestion : list1){
                %>
                <!--Ask question : ask question container start-->
                <!--alert message code start here-->
                <%
                             Message msgObj = (Message) session.getAttribute("editQueMsg");
                              if (msgObj != null) {
                %>
                <!--alert code start here-->
                <div class="alert <%= msgObj.getCls()%> alert-dismissible fade show" role="alert">
                    <strong><i class="<%= msgObj.getSign()%> ms-0 me-2" aria-hidden="true"></i></strong> <%= msgObj.getContent()%>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    session.removeAttribute("editQueMsg");
                    }
                %>
                <!--alert code end here-->
                <label class="form-text my-0">Edit title. Minimum 20 characters.</label>
                <input type="text" class="form-control mb-3" id="title" name="editTitle" value="<%=aQuestion.getTitle() %>" placeholder="Enter title here">
                <!--Ask question : ask question container start-->
                <!--Ask question : ask question container start-->
                <label class="form-text my-0">Edit Details. Minimum 20 characters.</label>
                <div id="editor-example-1" class="mb-3"></div>
                <div id="preview1" class="d-none"></div>
                <input type="hidden" class="form-control mb-3 text-dark" name="editQuestionDetails" id="txt1">
                <!--Ask question : ask question container end-->                
                <script>
                    <%
                        String editDetails = aQuestion.getDetailsque();
                        String replaceDetailsTxt = editDetails.replace("\"", "\\\"").replace("Edit", " ").replace("plaintext", " ");
                    %>
                    $(document).ready(() => {
                        document.getElementById('editor1').innerHTML = `<%= replaceDetailsTxt %>`;
                    });
                </script>
                <button type="submit" onclick="parseHTML()" id="editAnsBtn" disabled="disabled" class="btn btn-primary mb-4">Edit</button>
                <%
                    }
                    }
                %>
            </form>
        </div>
        <%
    }else if(editPost!=null){
        out.println(editPost);
    }else if(delQue!=null){
        out.println(delQue);
    }else if(delPost!=null){
        out.println(delPost);
    }
    }else{
        response.sendRedirect("discussion.jsp?que="+editQue);
    }
        %>
        <%@ include file="navbar_footer/footer.html" %>   
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
        <script src="js/stacks.min.js" type="text/javascript"></script>
        <script src="js/editqa.js" type="text/javascript"></script>
    </body>
</html>
