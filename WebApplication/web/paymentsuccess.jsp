<%-- 
    Document   : paymentsuccess
    Created on : 05/06/2020, 12:39:35 PM
    Author     : bappa
--%>

<<<<<<< HEAD
<%@page import="uts.isd.model.unregisteredUser"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.order"%>
=======
<<<<<<< Updated upstream
=======
<%@page import="uts.isd.model.unregisteredUser"%>
>>>>>>> Stashed changes
<%@page import="uts.isd.model.registeredUser"%>
>>>>>>> origin/Luke
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
<<<<<<< HEAD
            //store "sucess" attribute into string and is then used in a ternary operator to check whether it is null
            String success = (String) session.getAttribute("success");
            String message = (success == null) ? "" : success;
            //declares and initialises regUser/user/order and sets to null
=======
            String success = (String) session.getAttribute("success");
            String message = (success == null) ? "" : success;
<<<<<<< Updated upstream
            registeredUser regUser = (registeredUser) session.getAttribute("regUser");
=======
            //declares and initialises regUser/user/order and sets null
>>>>>>> origin/Luke
            registeredUser regUser = null;
            unregisteredUser user = null;
            order order = null;
            //check whether order exists and stores session into order bean
            if ((order) session.getAttribute("order") != null) {
                order = (order) session.getAttribute("order");
            }
            //checks whether regUser or Uesr session exists then saves into respective variable
            if ((registeredUser) session.getAttribute("regUser") != null) {
                regUser = (registeredUser) session.getAttribute("regUser");
            } else if ((unregisteredUser) session.getAttribute("User") != null) {
                user = (unregisteredUser) session.getAttribute("User");
            }
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> origin/Luke
        %>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
<<<<<<< HEAD
                <a href="main.jsp">Main Page</a>
                <!--checks whether a regUser exists since they can view certain tabs-->
                <% if (regUser != null) {%>
                <a href="viewPaymentServlet">Payment</a>
                <% } %>
                <a href="IoTDevices">Devices</a>
=======
                <% if (regUser != null) {%>
                <a href="viewPaymentServlet"><span class="fa fa-credit-card"></span></a>
                    <% } %>
                <a href="main2.jsp">Main Page</a>
>>>>>>> origin/Luke
                <% if (regUser != null) {%>
                <a href="LogoutServlet">Logout</a>
                <% } else {%>
                <a href="index.jsp">Register</a>
                <% }%>
            </div>
        </div>
        <div class="container">
            <center><p style="color:#45f542;"><%=message%></p></center>
<<<<<<< HEAD
            <!--if order exists it displays order details-->
                <% if (order != null) {%>
            <center><p style="color:#45f542">Your order costs: <%=order.getTotalCost()%></p></center>
            <center><p style="color:#45f542">Your orderID is <%=order.getOrderID()%></p></center>
                <% }%>
=======
<<<<<<< Updated upstream
=======
                <% if (order != null) {%>
            <center><p style="color:#45f542">Your order costs: <%=order.getTotalCost()%></p></center>
            <center><p style="color:#45f542">Your orderID is <%=order.getOrderID()%></p></center>
                <% } %>
>>>>>>> Stashed changes
>>>>>>> origin/Luke
        </div>
    </body>
</html>
