<%-- 
    Document   : discussion
    Created on : Dec 16, 2022, 10:38:23 AM
    Author     : Dell
--%>
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
//            if (request.getParameter("que") != null) {
//                out.println(request. getParameter("que"));
//            }
        %>
        <!--section 2 start here-->
        <div class="container my-3">
            <div class="d-flex mb-1">
                <div class="p-1"> <h1 class="mb-0">How to disable button when textbox is empty using javascript ?</h1></div>
                <div class="ms-auto p-1"><a href="askQuestions.jsp" class="btn btn-primary btnAnimation">Ask question</a></div>
            </div>
            <p>Asked <strong>2022-12-16 11:16:41</strong> | Like <strong>1</strong></p>
            <hr>
            <div class="d-flex">
                <div class="flex-shrink-0">
                    <!--<i class="fa fa-thumbs-up me-1" aria-hidden="true" style="font-size:56px;cursor: pointer;"></i>-->
                    <i class="fa fa-thumbs-o-up me-1" aria-hidden="true" style="font-size:56px;cursor: pointer;"></i>
                    <p class="text-center" style="font-size: 20px;">0</p>
                </div>
                <div class="flex-grow-1 ms-3">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt tenetur aliquid ipsam minus labore architecto quae ducimus dicta cumque, corrupti magni assumenda possimus voluptatum tempora quod molestias dignissimos quibusdam temporibus velit deleniti odit nam. Voluptas maxime et repudiandae repellendus mollitia animi sequi, amet, molestiae distinctio est quibusdam soluta harum ratione itaque vitae nulla, cupiditate voluptatum voluptates quam. Deleniti delectus perspiciatis commodi! Quae sunt aut, fugiat, nobis blanditiis iure architecto maxime adipisci, expedita quod cumque enim sequi delectus accusamus deserunt atque tempore quis dignissimos quidem. A et ab porro, quia voluptatum deleniti sunt illum quae libero voluptates ratione, dolorem quisquam officiis?</p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt tenetur aliquid ipsam minus labore architecto quae ducimus dicta cumque, corrupti magni assumenda possimus voluptatum tempora quod molestias dignissimos quibusdam temporibus velit deleniti odit nam. Voluptas maxime et repudiandae repellendus mollitia animi sequi, amet, molestiae distinctio est quibusdam soluta harum ratione itaque vitae nulla, cupiditate voluptatum voluptates quam. Deleniti delectus perspiciatis commodi! Quae sunt aut, fugiat, nobis blanditiis iure architecto maxime adipisci, expedita quod cumque enim sequi delectus accusamus deserunt atque tempore quis dignissimos quidem. A et ab porro, quia voluptatum deleniti sunt illum quae libero voluptates ratione, dolorem quisquam officiis?</p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt tenetur aliquid ipsam minus labore architecto quae ducimus dicta cumque, corrupti magni assumenda possimus voluptatum tempora quod molestias dignissimos quibusdam temporibus velit deleniti odit nam. Voluptas maxime et repudiandae repellendus mollitia animi sequi, amet, molestiae distinctio est quibusdam soluta harum ratione itaque vitae nulla, cupiditate voluptatum voluptates quam. Deleniti delectus perspiciatis commodi! Quae sunt aut, fugiat, nobis blanditiis iure architecto maxime adipisci, expedita quod cumque enim sequi delectus accusamus deserunt atque tempore quis dignissimos quidem. A et ab porro, quia voluptatum deleniti sunt illum quae libero voluptates ratione, dolorem quisquam officiis?</p>

                    <div class="d-flex justify-content-between">
                        <div class="p-2 flex-fill"><i class="fa fa-pencil me-1" aria-hidden="true"></i>Edit</div>
                        <div class="p-2">     
                            <img src="mediaFiles/user.png" alt="person image not found" width="32" height="32" class="rounded-circle me-2">Mayank
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--section 2 end here-->

        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
    </body>
</html>
