<%-- 
    Document   : cancelorder
    Created on : 2020-5-31, 10:09:18
    Author     : HH
--%>

<%@page import="uts.isd.model.Device"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page import="uts.isd.model.dao.DeviceDao"%>
<%@page import="uts.isd.model.order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<% String createorderError = (String) session.getAttribute("createorderError"); %>
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
            <h1>New Order</h1>
            <table class="table">
                <thead>
                <th>#</th>
                <th>Name</th>
                <th>Type</th>
                <th>Price</th>
              
                </thead>
                <tbody>
                    <%
                        DeviceDao deviceDao = new DeviceDao(new DBConnector().openConnection());
                        List<Device> res = deviceDao.getAllDevices();

                    %>
                    <%                        for (Device d : res) {
                    %>
                    <tr>
                        <td><%=d.getId()%></td>
                        <td><%=d.getName() %></td>
                        <td><%=d.getType() %></td>
                        <td><%=d.getPrice() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
                
            </table>
             
                <form method="post" action="CreateOrderServlet">
			<table>
				<tr><td>Device ID</td><td><input type="text" placeholder="Device ID" name="deviceid"></td></tr>
				<tr><td>Number</td><td><input type="text" placeholder="Number" name="number"></td></tr>
                                <tr><td>ShipmentAddres</td><td><input type="text" placeholder="ShipmentAddres" name="address"></td></tr>
                                <tr><td><input class="button" type="submit" value="Create Order"></td> <td><a class="button" href="main.jsp">Back</a></td> </tr>
                        </table>
                       
		</form>
                 <% if (createorderError != null) { %> <font color="red"><%=createorderError%><font> <%}%>
            
            
        </div>
           
    </body>
</html>
