<%-- 
    Document   : main
    Created on : Apr 30, 2020, 14:25:40 PM
    Author     : Kira
--%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.order"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                if(session.getAttribute("regUser")==null){
                    regUser = new registeredUser(103,"123","Yu","peng","Yunpeng@aa.com","123","a");
                    session.setAttribute("regUser", regUser);
                }
                else
                    regUser = (registeredUser)session.getAttribute("regUser");
                
            %>
            
            
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="main.jsp">Main Page</a>
                <a href="logout.jsp">Logout</a>
                </div>
            </div>
            
             <!-- Customer Dashboard -->
            <!-- Includes: 1. show user's  info; 2. cancel user's order account -->
            <div class="container">
                <h1>Customer Dashboard</h1>
                <table class="table">
                    <thead>
                        <th>First Name222</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Mobile</th>
                        <th>Address</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${regUser.firstName}</td>
                            <td>${regUser.lastName}</td>
                            <td>${regUser.email}</td>
                            <td>${regUser.password}</td>
                            <td>${regUser.mobile}</td>
                            <td>${regUser.savedAddress}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="left">
                    <a class="button" href="cancelaccount.jsp">Cancel</a>     
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
                    </thead>
                    <tbody>
                        <%
                           OrderDao orderdao = new OrderDao();
                           List<order> res = orderdao.selectOrdersByUserid(regUser.getUserID());
                           
                        %>
                        <%
                             for(order o : res){
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
                <form method="post" action="cancelorder.jsp">
			<table>
				<tr><td>OrderID</td><td><input type="text" placeholder="order ID to be canceled" name="orderid"></td></tr>
<!--                                <tr><td>UserUD</td><td><input type="text" placeholder="order ID to be canceled" name="orderid"></td></tr>
                                <tr><td>UserID</td><td name="userid"><%=regUser.getUserID()%></td></tr>-->
				<tr><td><input class="button" type="submit" value="Cancel Order"></td></tr>            
			</table>
                    
		</form>
               
               
            
            </div>
	</body>
</html>