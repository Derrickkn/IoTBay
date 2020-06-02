<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String loginError = (String) session.getAttribute("loginError");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>IoT Devices</title>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
        </div>
        <div class="container">
            <h1>IoT Devices</h1>
            <h2><%= request.getAttribute("name")%></h2>
            <table>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Stock</th>
                </tr>
                <%
                    List<Device> devices = (List<Device>) request.getAttribute("deviceList");
                    for (Device device : devices) {
                %>
                <tr>
                    <td><%= device.getId()%></td>
                    <td><%= device.getName()%></td>
                    <td><%= device.getType()%></td>
                    <td><%= device.getPrice()%></td>
                    <td><%= device.getQuantity()%></td>
                </tr>
                <%
                    }
                %>

            </table>
        </div>
    </body>
</html>