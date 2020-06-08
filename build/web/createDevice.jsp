<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String error = (String) session.getAttribute("DeviceCreateError");%>
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
            <div class="devices-container">
                <h1>Create Device</h1>
                <form method="post" action="EditDevice">
                    <%
                        if (error != null && !error.isEmpty()) {
                    %>
                    <div id="errorMsg" style="color: red;"><%= error%></div>
                    <%}%>
                    <table>
                        <tr><td>Name</td><td><input type="text" placeholder="Enter name" name="name" id="name"></td></tr>
                        <tr><td>Type</td><td><input type="text" placeholder="Enter Type" name="type" id="type"></td></tr>
                        <tr><td>Price</td><td><input type="text" placeholder="Enter Price" name="price" id="price"></td></tr>
                        <tr><td>Stock</td><td><input type="text" placeholder="Enter Stock" name="stock" id="stock"><td></tr>
                        <tr><td><input class="button" type="submit" value="Submit"></td></tr> 
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>