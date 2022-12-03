<%--
    Document   : logout
    Created on : Nov 28, 2022, 2:57:59 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
        <p>please wait...</p>
        <%
            session.removeAttribute("userActive");
            response.sendRedirect("questions.jsp");
        %>
    </body>
</html>
