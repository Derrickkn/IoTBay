<%-- 
    Document   : staffmanage
    Created on : Jun 2, 2020, 2:00:03 PM
    Author     : Kira
--%>

<%@page import="uts.isd.model.staff"%>
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
                 staff staff = null;
                if(session.getAttribute("staff")==null){
             
                    session.setAttribute("staff", staff);
                    
                }
                else
                    staff = (staff)session.getAttribute("staff");
                
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                    <a class="active" href="admindashboard.jsp">Dashboard</a>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
            <div class="container">
                <h1>Staff Detail Management</h1>
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
                            <td>${staff.firstName}</td>
                            <td>${staff.lastName}</td>
                            <td>${staff.email}</td>
                            <td>${staff.password}</td>
                            <td>${staff.mobile}</td>
                            <td>${staff.savedAddress}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="left">
                    <a class="button" href="admindashboard.jsp">Cancel</a> <a class="button" href="editstaff.jsp">Edit</a> <a class="button" href="deletestaff.jsp">Delete</a>          
                </div>
	</body>
</html>