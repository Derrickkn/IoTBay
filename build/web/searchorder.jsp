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
<% String ordersearchError1 = (String) session.getAttribute("ordersearchError"); %>
<% String ordersearchError2 = (String) session.getAttribute("ordersearchError2"); %>
<% order o = (order)session.getAttribute("order");  %>
<% List<order> os = (List<order>)session.getAttribute("orders");  %>

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
            <h1>Search Order By ID</h1>
              <% if(o!=null ){ %>
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

                        <tr>
                            <td><%=o.getOrderID()%></td>
                            <td><%=o.getOrderDate()%></td>
                            <td><%=o.getTrackingNo()%></td>
                            <td><%=o.isOrderPaid()%></td>
                            <td><%=o.getOrderStatus()%></td>
                            <td><%=o.getTotalCost()%></td>
                             <td><%=o.getShipmentAddress() %></td>
                        </tr>

                    </tbody>
                </table>
              <% } %>
             <form method="post" action="SearchOrderByIdServlet">
                <table>
                    <tr><td>OrderID</td><td><input type="text" placeholder="order ID " name="orderid"></td></tr>
                    
                    <tr><td><input class="button" type="submit" value="Search"></td>
                        <td><a class="button" href="main.jsp">Back</a></td>
                    </tr>
                     
                </table>

            </form>
                     <% if (ordersearchError1 != null) { %> <font color="red"><%=ordersearchError1%></font> <%}%>
            
        </div>
                     
        <!--Search Order By Date-->             
        <div class="container">
            <h1>Search Order By Date</h1>
            <% if(os!=null) { %>
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
                        <%  for(order o2 : os) {
                        %>
                        <tr>
                            <td><%=o2.getOrderID()%></td>
                            <td><%=o2.getOrderDate()%></td>
                            <td><%=o2.getTrackingNo()%></td>
                            <td><%=o2.isOrderPaid()%></td>
                            <td><%=o2.getOrderStatus()%></td>
                            <td><%=o2.getTotalCost()%></td>
                             <td><%=o2.getShipmentAddress() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            <% } %>
             <form method="post" action="SearchOrderByDateServlet">
                <table>
                    <tr><td>Order Date</td><td><input type="text" placeholder="yyyy-mm-dd" name="date"></td></tr>
                   
                    <tr><td><input class="button" type="submit" value="Search"></td>
                        <td><a class="button" href="main.jsp">Back</a></td>
                    </tr>
                     
                </table>

            </form>
                     <% if (ordersearchError2 != null) { %> <font color="red"><%=ordersearchError2%></font> <%}%>
         
            
            
        </div>
           
    </body>
</html>
