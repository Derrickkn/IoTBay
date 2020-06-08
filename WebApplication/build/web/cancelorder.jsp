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
<% String ordercancelError = (String) session.getAttribute("ordercancelError"); %>
<% registeredUser regUser = (registeredUser) session.getAttribute("regUser"); %>
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
        
        <div class="container">
            <h1>Cancel Order</h1>
            <table class="table">
                <thead>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Tracking Number</th>
                <th>Order Paid</th>
                <th>Order Status</th>
                <th>Order Cost</th>
                </thead>
                <tbody>
                    <%
                        OrderDao orderdao = new OrderDao();
                        List<order> res = orderdao.selectOrdersByUserid(regUser.getUserID());

                    %>
                    <%                        for (order o : res) {
                    %>
                    <tr>
                        <td><%=o.getOrderID()%></td>
                        <td><%=o.getOrderDate()%></td>
                        <td><%=o.getTrackingNo()%></td>
                        <td><%=o.isOrderPaid()%></td>
                        <td><%=o.getOrderStatus()%></td>
                        <td><%=o.getTotalCost()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
             <form method="post" action="CancelOrderServlet">
                <table>
                    <tr><td>OrderID</td><td><input type="text" placeholder="order ID to be canceled" name="orderid"></td></tr>
                   
                    <tr><td><input class="button" type="submit" value="Cancel Order"></td>
                        <td><a class="button" href="main.jsp">Back</a></td>
                    </tr>
                     
                </table>

            </form>
                     <% if (ordercancelError != null) { %> <font color="red"><%=ordercancelError%><font> <%}%>
         
            
            
        </div>
           
    </body>
</html>
