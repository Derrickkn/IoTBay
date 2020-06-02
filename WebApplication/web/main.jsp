<%-- 
    Document   : main
    Created on : Apr 30, 2020, 14:25:40 PM
    Author     : Kira
--%>
<%@page import="uts.isd.model.registeredUser"%>
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
                registeredUser regUser = (registeredUser)session.getAttribute("regUser");
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="main.jsp">Main Page</a>
                <a href="logout.jsp">Logout</a>
                </div>
            </div>
            <div class="container">
                <h1>Customer Dashboard</h1>
                <table class="table">
                    <thead>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Mobile</th>
                        <th>Address</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${regUser.fname}</td>
                            <td>${regUser.lname}</td>
                            <td>${regUser.email}</td>
                            <td>${regUser.password}</td>
                            <td>${regUser.mobile}</td>
                            <td>${regUser.address}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="left">
                    <a class="button" href="welcome.jsp">Cancel</a>     
                </div>
            </div>
	</body>
</html>