<%-- 
    Document   : edit.jsp
    Created on : Dec 22, 2022, 8:33:22 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@ include file="navbar_footer/footer.html" %>
        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
        <script src="js/stacks.min.js" type="text/javascript"></script>
    </body>
</html>
