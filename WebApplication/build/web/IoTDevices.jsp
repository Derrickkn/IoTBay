<%@page import="uts.isd.model.registeredUser"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%
            registeredUser user = (registeredUser) session.getAttribute("regUser");
        %>
        <div class="container">
            <div class="devices-container">
                <h1>IoT Devices</h1>
                <% if (user != null && user.getUserType().equals("S")) {%>
                <a class="button devices-create-btn" href="createDevice.jsp">Create</a>
                <%}%>
            </div>
            <form action="IoTDevices" class="devices-container">
                Search by Name: 
                <input type="text" placeholder="Enter Device Name" name="name">
                ID: <input type="text" placeholder="Enter Device ID" name="deviceId">
                <input class="button" type="submit" value="Search" style="padding: 5px 18px">
            </form>
            <table class="table">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th></th>
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
                    <td>
                        <% if (user != null && user.getUserType().equals("S")) {%>
                        <form action="DeleteDeviceServlet" method="POST" class="inline-form">
                            <input name="deviceId" value="<%= device.getId()%>" style="display: none">
                            <button type="submit">Delete</button>
                        </form>
                        <button onclick="window.location.href = 'EditDevice?deviceId=<%= device.getId()%>'">Update</button>
                        <%}%>
                    </td>
                </tr>
                <%
                    }
                %>

            </table>
        </div>
    </body>
</html>