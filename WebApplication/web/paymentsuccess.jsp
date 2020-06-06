<%-- 
    Document   : paymentsuccess
    Created on : 05/06/2020, 12:39:35 PM
    Author     : bappa
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <title>Logout Page</title>
        <%
            String success = (String) session.getAttribute("success");
            String message = (success == null) ? "" : success;
            registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        %>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
                <% if (regUser != null) {%>
                <a href="viewPaymentServlet"><span class="fa fa-credit-card"></span></a>
                    <% } %>
                <a href="main2.jsp">Main Page</a>
                <% if (regUser != null) {%>
                <a href="LogoutServlet">Logout</a>
                <% } else {%>
                <a href="index.jsp">Register</a>
                <% }%>
            </div>
        </div>
        <div class="container">
            <center><p style="color:#45f542;"><%=message%></p></center>
        </div>
    </body>
</html>
