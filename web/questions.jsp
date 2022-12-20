<%--
    Document   : questions
    Created on : Nov 15, 2022, 8:54:01 AM
    Author     : Dell
--%>
<%@page import="com.stackuncontrol.entities.askQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.stackuncontrol.helper.dbconnection.DBConnection"%>
<%@page import="com.stackuncontrol.db.askQuestionDao"%>
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
        <link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="node_modules/@stackoverflow/stacks-editor/dist/styles.css" />
        <link href="css/stacks.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@ include file="navbar_footer/navbar.jsp" %>
        <%
       int countNum=0;
        %>
        <!--tags, questions and search bar section start-->
        <div class="container"> 
            <div class="navbar bg-white">
                <div class="container-fluid">
                    <div class="navbar-brand">
                        <a class="btn btn-primary btnAnimation" href="tags.jsp">Tags</a>
                        <a class="btn btn-primary btnAnimation" href="askQuestions.jsp">Ask Question</a>
                    </div>
                </div>
            </div>
        </div>
        <!--tags, questions and search bar section end-->

        <!--filter and total question text start-->
        <div class="container">
            <div class="navbar bg-white">
                <div class="container-fluid">
                    <div>
                        <p class="mb-0" id="countNum">0 Questions</p>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <%
            askQuestionDao dao = new askQuestionDao(DBConnection.isConnection());
            ArrayList<askQuestion> list1 =  dao.fetchQuestion();
        %>
        <!--filter and total question text end-->
        <!--Questions section start-->
        <div class="container my-5">
            <table class="table" id="example">
                <thead style="display: none;">
                    <tr>
                        <th scope="col">Example</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                               for(askQuestion aQuestion : list1){
                               if(aQuestion.getTitle()==null && aQuestion.getDetailsque()==null)
                                {
                                    break;
                                }
                               countNum++;
                    %>
                    <tr>
                        <td>
                            <div class="row mb-0 mb-3">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">
                                        <!--answer counter start-->
                                        <div class="flex-shrink-0">
                                            <p class="mb-0 bg-light">1 answer</p>
                                        </div>
                                        <!--answer counter end-->
                                        <div class="flex-grow-1 ms-3">
                                            <a href="discussion.jsp?que=<%= aQuestion.getRanQueId() %>" class="fw-bold fs-4 mb-1 questionLink"><%= aQuestion.getTitle() %></a>
                                            <%
                                                String str = aQuestion.getDetailsque();
                                                str = str.replaceAll("\\<.*?\\>", " ").replace("Edit", " ").replace("plaintext", " ");
                                                if(str.length() >= 350){
                                            %>
                                            <div class="my-1"><%= str.substring(0,350)+"..." %></div>
                                            <%
                                                }else{
                                            %>
                                            <div class="my-1"><%= str.substring(0,345)+"..."  %></div>                                                
                                            <%
                                            }
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="d-flex flex-row-reverse align-items-center">
                                        <p class="mb-0 me-5"><%= aQuestion.getUname() %><span>, asked <%= aQuestion.getTime()  %></span></p>
                                        <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!--Questions section end-->
        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
        <script src="js/askQuestions.js" defer type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
            document.getElementById('countNum').innerHTML =<%= countNum %> + " Questions";
        </script>
    </body>
</html>
