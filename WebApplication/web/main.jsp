<%-- 
    Document   : main
    Created on : Apr 30, 2020, 14:25:40 PM
    Author     : Kira
--%>
<%@page import="uts.isd.model.Customer"%>
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
                Customer customer = (Customer)session.getAttribute("customer");
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
                        <th>Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${customer.name}</td>
                            <td>${customer.email}</td>
                            <td>${customer.password}</td>
                            <td>${customer.dob}</td>
                            <td>${customer.gender}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="left">
                    <a class="button" href="welcome.jsp">Cancel</a>     
                </div>
            </div>
	</body>
</html>