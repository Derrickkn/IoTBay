<%-- 
    Document   : cusmanage
    Created on : Jun 2, 2020, 1:58:33 PM
    Author     : Kira
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.dao.UserDao"%>
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
                if(session.getAttribute("regUser")==null) session.setAttribute("regUser", regUser);
                else  regUser = (registeredUser)session.getAttribute("regUser");
                   
                String userType = regUser.getUserType();
                
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                    <% if (userType.equals("A")) { %>
                        <a class="active" href="adminDashboardServlet">Dashboard</a>
                        <a href="main.jsp">Main Page</a>
                        <a href="LogoutServlet">Logout</a>
                   <% } else {%>
                       <a class="active" href="main.jsp">Main Page</a>
                       <a href="LogoutServlet">Logout</a>
                   <% } %> 
                </div>
            </div>
            <div class="container">
                <h1>Customer Detail Management</h1>
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
                         <%
                            ArrayList<registeredUser> allUsers = (ArrayList<registeredUser>)session.getAttribute("allUsers");
                            for (registeredUser x : allUsers) {
                         %>
                        <tr>
                            <td><%=x.getFirstName()%></td>
                            <td><%=x.getLastName()%></td>
                            <td><%=x.getEmail()%></td>
                            <td><%=x.getPassword()%></td>
                            <td><%=x.getMobile()%></td>
                            <td><%=x.getSavedAddress()%></td>
                        </tr>
                        <%                            
                            }
                        %>
                    </tbody>
                   
                </table>
                <div class="left">
                    <a class="button" href="admindashboard.jsp">Cancel</a> <a class="button" href="editcustomer.jsp">Edit</a> <a class="button" href="deletecustomer.jsp">Delete</a>          
                </div>
	</body>
</html>