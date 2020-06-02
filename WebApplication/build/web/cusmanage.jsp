<%-- 
    Document   : cusmanage
    Created on : Jun 2, 2020, 1:58:33 PM
    Author     : Kira
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Staff Management</title>
	</head>
	<body>
            <%
                 registeredUser regUser = null;
                if(session.getAttribute("regUser")==null){
             
                    session.setAttribute("regUser", regUser);
                    
                }
                else
                    regUser = (registeredUser)session.getAttribute("regUser");
                
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                    <a class="active" href="admindashboard.jsp">Dashboard</a>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
            <div class="container">
                <h1>Customer Detail Management</h1>
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
                    <a class="button" href="admindashboard.jsp">Cancel</a> <a class="button" href="editcustomer.jsp">Edit</a> <a class="button" href="deletecustomer.jsp">Delete</a>          
                </div>
	</body>
</html>