<%--
    Document   : index
    Created on : Nov 4, 2022, 9:05:51 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stack Uncontrol - Where Developers Learn, Share, &amp; Build Careers</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keyword" content="Question and answer for topic computer programming language.">
        <meta name="description" content="Stack Uncontrol is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers." >
        <!--bootstrap style start here-->
        <link href="css/bootStyle.css" rel="stylesheet" type="text/css"/>
        <!--my css styles start here-->
        <link rel="shortcut icon" href="mediaFiles/favicon.ico" type="image/x-icon">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles_utility.css" rel="stylesheet" type="text/css"/>
        <link href="css/mediaQuery.css" rel="stylesheet" type="text/css"/>
        <!--icon silder link start here-->
        <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/owl.theme.default.css" rel="stylesheet" type="text/css"/>
        <!--website content animation style start here-->
        <link href="css/aos.css" rel="stylesheet" type="text/css"/>
        <!--fonts awesome icon link start here-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <%@ include file="navbar_footer/navbar.jsp" %>
        <%@ include file="navbar_footer/welcomeSection.html" %>
        <%@ include file="navbar_footer/footer.html" %>


        <!--boostrap script start here-->
        <script src="js/bootJs.js" defer type="text/javascript"></script>
        <!--jquery script start here-->
        <script src="js/jquery.js" type="text/javascript"></script>
        <!--toploading bar script start here-->
        <script src="js/topBarLoading.js" defer type="text/javascript"></script>
        <script src="js/topbar.js" defer type="text/javascript"></script>
        <script src="js/topbar.min.js" defer type="text/javascript"></script>
        <script src="js/prettify.min.js" defer type="text/javascript"></script>
        <!--icon silder script start here-->
        <script src="js/owl.carousel.min.js" type="text/javascript"></script>
        <!--Website content animation script start here-->
        <script src="js/aos.js" defer type="text/javascript"></script>
        <script>
            //logo silder
            $('.brand-carousel').owlCarousel({
                loop: true,
                margin: 10,
                autoplay: true,
                responsive: {
                    0: {
                        items: 1
                    }
                    ,
                    600: {
                        items: 3
                    }
                    ,
                    1000: {
                        items: 5
                    }
                }
            }
            );
        </script>
    </body>
</html>
