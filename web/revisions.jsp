<%-- 
    Document   : revisions
    Created on : Dec 27, 2022, 8:07:50 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.stackuncontrol.entities.askQuestion"%>
<%@page import="com.stackuncontrol.entities.PostAns"%>
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
            ServletContext sc = getServletContext();
                String ranQuetId = (String) sc.getAttribute("ranQueid");
         String editQue = request.getParameter("que");
         String editPost = request.getParameter("post");
         askQuestionDao dao = new askQuestionDao(DBConnection.isConnection());
         if(user!=null){
           if(editQue!=null){
         ArrayList<askQuestion> list1 =  dao.fetchRevisionsData(editQue);
        %>
        <div class="container my-5">
            <!--part - 1 alert message start here-->
            <%
                if(list1.isEmpty()){
            %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading my-3">No one has changed the question.</h4>
                <p>If you need some correction on this question then re-edit the question. We welcome edits that make the post easier to understand and more valuable for readers. Because community members review edits, please try to make the post substantially better than how you found it, for example, by fixing grammar or adding additional resources and hyperlinks.</p>
            </div>
            <%
            }else{
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
                }
            %>
        </div>
        <%
       }else if(editPost!=null){
            ArrayList<PostAns> list1 =  dao.fetchRevisionsData2(editPost);
        %>
        <div class="container my-5">
            <!--part - 1 alert message start here-->
            <%
                if(list1.isEmpty()){
            %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading my-3">No one has changed the post.</h4>
                <p>If you need some correction on this post then re-edit the post. We welcome edits that make the post easier to understand and more valuable for readers. Because community members review edits, please try to make the post substantially better than how you found it, for example, by fixing grammar or adding additional resources and hyperlinks.</p>
            </div>
            <%
            }else{
            for(PostAns pans : list1){
            %>
            <div class="alert alert-primary" role="alert">
                <div class="d-flex mb-3 align-items-center">
                    <div class="p-2">Added some correction in body.</div>
                    <div class="ms-auto p-2">
                        <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2">  <%=pans.getPostuname()  %><p class="my-1">Asked <strong><%=pans.getTime()  %></strong> | Like <strong>1</strong></p>
                    </div>
                </div>
            </div>
            <!--part - 1 alert message end  here-->
            <!--part - 2 correction start here-->
            <div class="RevisionsCodePalette">
                <%= pans.getPostDetail()%>
            </div>
            <hr>
            <!--part - 2 correction end  here-->
            <%
                }
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
        }else{
        response.sendRedirect("discussion.jsp?que="+ranQuetId);
        sc.removeAttribute(ranQuetId);
        }
        %>
        <!--main section end here-->
        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
    </body>
</html>
