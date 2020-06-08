<%-- 
    Document   : cancelorder
    Created on : 2020-5-31, 10:09:18
    Author     : HH
--%>

<%@page import="uts.isd.model.order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<% String loadorderError = (String) session.getAttribute("loadorderError"); %>
<% String updateorderError = (String) session.getAttribute("updateorderError"); %>
<% order o = (order)session.getAttribute("order");  %>

<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Welcome Page</title>
	</head>
    <body>
        <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
                </div>
        </div>
        
        
        <!--Search Order By ID-->
        <div class="container">
            <h1>Update Order By ID</h1>
              
             <form method="post" action="LoadOrderInfodServlet">
                <table>
                    <tr><td>OrderID</td><td><input type="text" placeholder="order ID " name="orderid"></td></tr>
                    
                    <tr><td><input class="button" type="submit" value="Load Order Info"></td>
                        <td><a class="button" href="main.jsp">Back</a></td>
                    </tr>
                     
                </table>

            </form>
             <% if (loadorderError != null) { %> <font color="red"><%=loadorderError%></font> <%}%>

        </div>
        <% if(o!=null) { %>
        <div class="container">
            <h1>Edit Order Details</h1>
            <form method="post" action="UpdateOrderServlet">
                <table>
                    <tr><td>OrderID</td><td><input type="text" placeholder="OrderID" readonly="true" name="orderid" value="<%= o.getOrderID() %>" ></td></tr>
                    <tr><td>OrderDate</td><td><input type="text" placeholder="OrderDate" readonly="true" name="orderdate" value="<%=o.getOrderDate() %>"></td></tr>
                    <tr><td>TrackingNumber</td><td><input  type="text" placeholder="TrackingNumber" readonly="true" name="tn" value="<%=o.getTrackingNo() %>"></td></tr>
                    <tr><td>OrderPaid</td><td><input type="password" placeholder="OrderPaid" readonly="true" name="op" value="<%=o.isOrderPaid() %>"> </td></tr>
                    <tr><td>OrderStatus</td><td><input type="tel" placeholder="OrderStatus"  readonly="true" name="os" value="<%=o.getOrderStatus() %>"></td></tr>
                    <tr><td><font color="green">ShipmentAddress</font></td><td><input type="text" placeholder="ShipmentAddress" name="address" value="<%=o.getShipmentAddress() %>"></td></tr>
                   <tr><td><input class="button" type="submit" value="Update Order"></td>
            </form>
                   <% if (updateorderError != null) { %> <font color="red"><%=updateorderError%></font> <%}%>
        </div>
        <% } %>
       
           
    </body>
</html>
