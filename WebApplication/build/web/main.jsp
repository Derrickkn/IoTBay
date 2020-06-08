<%-- 
    Document   : main
    Created on : Apr 30, 2020, 14:25:40 PM
    Author     : Kira
    Edited by  : Yupeng
--%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.order"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String orderError = (String) session.getAttribute("orderError"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>Main Page</title>
    </head>
    <body>
        <%
            registeredUser regUser = null;
            if (session.getAttribute("regUser") == null) {
                regUser = new registeredUser(103, "123", "Yu", "peng", "Yunpeng@aa.com", "123", "a");
                session.setAttribute("regUser", regUser);
            } else {
                regUser = (registeredUser) session.getAttribute("regUser");
            }

            String userType = regUser.getUserType();

        %>

        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <!-- administrator dashboard only displays when  administrator is logged in-->
            <div class="header-right">
                <!-- checks for user type A, which is administrator-->
                <% if (userType.equals("A")) { %>
                <a class="active" href="adminDashboardServlet">Dashboard</a>
                <a href="main.jsp">Main Page</a>
                <a href="IoTDevices">Devices</a>
                <a href="LogoutServlet">Logout</a>
                <% } else {%>
                <a class="active" href="main.jsp">Main Page</a>
                <a href="viewPaymentServlet">Payments</a>
                   <a href="IoTDevices">Devices</a>
                    <a href="LogoutServlet">Logout</a>
                    <% } %> 
            </div>
        </div>

        <!-- Customer Dashboard -->
        <!-- Includes: 1. show user's  info; 2. cancel user's order account -->
        <% String savedAddress = regUser.getSavedAddress();
            String paymentMethod = regUser.getPaymentMethod();
            String paymentDetail = regUser.getPaymentDetail();
            if (savedAddress == null || savedAddress.equals("")) {
                savedAddress = "Not Set";
            }
            if (paymentMethod == null || paymentMethod.equals("")) {
                paymentMethod = "Not Set";
            }
            if (paymentDetail == null || paymentDetail.equals("")) {
                paymentDetail = "Not Set";
            }
        %>
        <div class="container">
            <h1>Customer Dashboard</h1>
            <table class="table">
                <thead>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Mobile</th>
                </thead>
                <tbody>
                    <tr>
                        <td>${regUser.getFirstName()}</td>
                        <td>${regUser.getLastName()}</td>
                        <td>${regUser.getEmail()}</td>
                        <td>${regUser.getMobile()}</td>
                    </tr>
                </tbody>
            </table>
            <table class="table">
                <thead>
                <th>Address</th>
                <th>Payment Method</th>
                <th>Payment Details</th>
                </thead>
                <tbody>
                    <tr>
                        <td><%=savedAddress%></td>
                        <td><%=paymentMethod%></td>
                        <td><%=paymentDetail%></td>
                    </tr>
                </tbody>
            </table>
            <div class="left">
                <a class="button" href="editcustomerdetails.jsp">Edit Details</a>
                <a class="button" href="viewaccesslog.jsp">View Access Logs</a>
                <a class="button" href="deactivateaccount.jsp">DEACTIVATE ACCOUNT</a>  
            </div>
        </div>

        <!-- Order Dashboard -->
        <!-- Includes: 1. show user's order info; 2. cancel user's order order -->
        <div class="container">
            <h1>Order Dashboard</h1>
            <table class="table">
                <thead>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Tracking Number</th>
                <th>Order Paid</th>
                <th>Order Status</th>
                <th>Order Cost</th>
                <th>Shipment Address</th>
                </thead>
                <tbody>
                    <%
                        OrderDao orderdao = new OrderDao();
                        List<order> res = orderdao.selectOrdersByUserid(regUser.getUserID());

                    %>
                    <%   for (order o : res) {
                    %>
                    <tr>
                        <td><%=o.getOrderID()%></td>
                        <td><%=o.getOrderDate()%></td>
                        <td><%=o.getTrackingNo()%></td>
                        <td><%=o.isOrderPaid()%></td>
                        <td><%=o.getOrderStatus()%></td>
                        <td><%=o.getTotalCost()%></td>
                        <td><%=o.getShipmentAddress()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <div class="left">
                <a class="button" href="cancelorder.jsp">Cancel Order</a>
                <a class="button" href="searchorder.jsp">Search Order</a> 
                <a class="button" href="updateorder.jsp">Update Order</a>
                <a class="button" href="createorder.jsp">Create Order</a> 
            </div>
        </div>
    </body>
</html>