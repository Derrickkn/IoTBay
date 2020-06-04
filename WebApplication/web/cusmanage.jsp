<%-- 
    Document   : cusmanage
    Created on : Jun 2, 2020, 1:58:33 PM
    Author     : Kira
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.UserDao"%>
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
                if(session.getAttribute("regUser") == null){
                    session.setAttribute("regUser", regUser);   
                }
                else{
                    regUser = (registeredUser)session.getAttribute("regUser");
                }
                
                String userType = regUser.getUserType();
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                    <a class="active" href="admindashboard.jsp">Dashboard</a>
                    <a href="LogoutServlet">Logout</a>
                </div>
            </div>
            <div class="container">
                <h1>Customer Detail Management</h1>
                <table class="table">
                    <thead>       
                        <th>User ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Mobile</th>
                        <th>Address</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${regUser.userID}</td>
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
                    <form method="post" action="EditServlet">
                        <p>Select user by ID to modify or remove:</p>
                        <label for="userID">user ID:</label>
                        <input type="text" id="userID" name="userID"><br><br>
                        <input class="button" type="submit" href="editcustomer.jsp" value="Edit">
                        <input class="button" type="submit" href="deletecustome.jsp" value="Delete">
                    </form>
                    <a class="button" href="admindashboard.jsp">Cancel</a>     
                </div>
	</body>
</html>