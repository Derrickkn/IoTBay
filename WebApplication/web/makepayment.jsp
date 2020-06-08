<%@page import="uts.isd.model.order"%>
<%@page import="uts.isd.model.unregisteredUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.payment"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <style>
            h3, h5, label, p {
                color:white;
            }
            input {
                width:100%;
            }
            i {
                color:white;
            }
        </style>
        <title>Make Payment</title>
        <%
            //Order order= (Order) session.getAttribute("order")/ waiting on Yupeng (Responsible for Feature 3)
            //int orderid= order.getOrderID() || user.getUserID()
            //unregisteredUser user= unregisteredUser (unregisteredUser) session.getAttribute("user")/ waiting on Yupeng (Responsible for Feature 3)
            registeredUser regUser = null;
            unregisteredUser user = null;
            //declare and initialise order bean as null
            order order = null;
            //store error message
            String message = ((String) session.getAttribute("paymenterror") != null) ? (String) session.getAttribute("paymenterror") : "";
            //set a default orderid in case order does not exist or colleges feature does not happen to work properly
            int orderid = 1;
            //checks whether orderid exists if yes store order session into order bean and store id of order into orderid
            if ((order) session.getAttribute("order") != null) {
                order = (order) session.getAttribute("order");
                orderid = order.getOrderID();
            }
            //make sure that session variables are not null then store into regUser or user
            if ((unregisteredUser) session.getAttribute("User") != null) {
                user = (unregisteredUser) session.getAttribute("User");
            } //retrieve a registeredUser variable and store it in user and set userID to userID of registeredUser
            else if ((registeredUser) session.getAttribute("regUser") != null) {
                regUser = (registeredUser) session.getAttribute("regUser");
            }
        %>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
                <% if (regUser != null) {%>
                <a href="main.jsp">Main Page</a>
                <a href="viewPaymentServlet">Payment</a>
                <% } %>
                <a href="IoTDevices">Devices</a>
                <% if (regUser != null) {%>
                <a href="LogoutServlet">Logout</a>
                <% } else {%>
                <a href="index.jsp">Register</a>
                <% }%>
            </div>
        </div>
            <!--checks whether a user (unregistered or registered) exists, If yes then system will show the form -->
        <% if (user != null || regUser != null) {%>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <center><h3>Comfirm your payment </h3></center>
                    <center><h5>You may choose not to update or delete payment payment details</h5></center>
                    <center><h5 style="color:orange;"><%= message%></h5></center>
                    <form method="post" action="confirmPaymentServlet">
                        <div class="form-group">
                            <i class="fa fa-cc-visa" style="font-size:36px"></i>
                            <i class="fa fa-cc-mastercard" style="font-size:36px"></i>
                            <i class="fa fa-cc-amex" style="font-size:36px"></i><br>
                            <label for="method">Payment Method</label>
                            <select name="paymethod" id="method" size="1" name="method" class="form-control">
                                <option value="method">Choose Method</option>
                                <option value="Visa">Visa</option>
                                <option value="Mastercard">Mastercard</option>
                                <option value="AmericanExpress">American Express</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="cardNo">Card Number</label>
                            <input type="text" placeholder="e.g. 4122908758931098, no spaces and 16 characters" class= "form-control" name="cardNo" id="cardNo">
                        </div>
                        <div>
                            <!-- if statement to check whether regUser userstupe is 'Registered' and check whether unregisteredUser is not null -->
                            <%if (regUser.getUserType().equals("R") || user != null) {%>
                            <label class="radio-inline"><input type="radio" name="change" value="update">Update payment detail</label>
                            <label class="radio-inline" style="float:right"><input type="radio" name="change" value="delete">Delete payment detail</label>
                            <!--store the orderid in a hidden field-->
                            <input type="hidden" name="orderID" value="<%=orderid%>"
                        </div><br>
                        <% }%>
                        <button type="submit" class="btn btn-primary">Make Payment</button>
                    </form>
                </div>
            </div>
            <% }%>
    </body>
</html>