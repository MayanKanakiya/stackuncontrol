<%--
    Document   : askQuestions
    Created on : Nov 17, 2022, 10:01:20 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Ask question</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keyword" content="Question and answer for topic computer programming language.">
        <meta name="description" content="Stack Uncontrol is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers." >
        <link rel="shortcut icon" href="mediaFiles/favicon.ico" type="image/x-icon">
        <!--stacks-editor link start here-->
        <link rel="stylesheet" href="node_modules/@stackoverflow/stacks-editor/dist/styles.css" />
        <link href="css/stacks.min.css" rel="stylesheet" type="text/css"/>
        <!--stacks-editor link start end-->
        <link href="css/bootStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles_utility.css" rel="stylesheet" type="text/css"/>
        <link href="css/mediaQuery.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@ include file="navbar_footer/navbar.jsp" %>
        <div class="container my-4 mb-4">
            <h1 class="mb-3">Ask a public question</h1>
            <!--Ask question alert container start-->
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Writing a good question</h4>
                <p>You’re ready to ask a programming-related question and this form will help guide you through the process.

                    Looking to ask a non-programming question? See the topics here to find a relevant site.
                </p>
                <p class="mb-0">Steps:</p>
                <ul>
                    <li>Summarize your problem in a one-line title.</li>
                    <li>Describe your problem in more detail.</li>
                    <li>Describe what you tried and what you expected to happen.
                    </li>
                    <li>Review your question and post it to the site.</li>
                </ul>
            </div>
        </div>
        <!--Ask question alert container end-->

        <!--Ask question : title container start-->
        <div class="container">
            <form id="askQuestionMainForm">
                <label for="title" class="form-label mb-0">Title</label>
                <div class="form-text my-0">Be specific and imagine you’re asking a question to another person. Minimum 20 characters.</div>
                <input type="text" class="form-control mb-3" id="title" placeholder="Enter title here">
                <!--Ask question : title container end-->

                <!--Ask question : ask question container start-->
                <label for="editor-example-1" class="form-label mb-0">What are the details of your problem?</label>
                <div class="form-text my-0">Introduce the problem and expand on what you put in the title. Minimum 20 characters.</div>
                <div id="editor-example-1" class="mb-3"></div>
                <!--Ask question : ask question container end-->

                <!--Ask question : ask question excepted container start-->
                <label for="editor-example-2" class="form-label mb-0">What did you try and what were you expecting?</label>
                <div class="form-text my-0">Describe what you tried, what you expected to happen, and what actually resulted. Minimum 20 characters.</div>
                <div id="editor-example-2" class="mb-4"></div>
                <button type="submit" id="questionBtn" disabled="disabled" class="btn btn-primary mb-4">Submit</button>
            </form>
        </div>
        <!--Ask question : ask question excepted container end-->
        <%@ include file="navbar_footer/footer.html" %>
        <script src="node_modules/@stackoverflow/stacks-editor/dist/app.bundle.js"></script>
        <script src="js/stacks.min.js" type="text/javascript"></script>
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <script src="js/askQuestions.js" defer type="text/javascript"></script>
    </body>
</html>
