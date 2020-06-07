<%-- 
    Document   : paymentsuccess
    Created on : 05/06/2020, 12:39:35 PM
    Author     : bappa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>Logout Page</title>
        <%
            String success = (String) session.getAttribute("success");
            String message = (success == null) ? "" : success;
        %>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
                <a href="viewPaymentServlet"><span class="fa fa-credit-card"></span></a>
                <a href="main2.jsp">Main Page</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
        <div class="container">
            <center><p style="color:green;"><%=message%></p></center>
        </div>
    </body>
</html>
