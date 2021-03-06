<%-- 
    Document   : staffcreate
    Created on : Jun 7, 2020, 6:57:50 PM
    Author     : Kira
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String regError = (String) session.getAttribute("regError"); %>
<% String regEmailError = (String) session.getAttribute("regEmailError"); %>
<% String regPasswordError = (String) session.getAttribute("regPasswordError"); %>
<% String regMobileError = (String) session.getAttribute("regMobileError"); %>
<% String userExistError = (String) session.getAttribute("userExistError"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>New Staff Record</title>
	</head>
	<body>
            <%
                //getting user of the current session
                registeredUser regUser = null;
                if(session.getAttribute("regUser")==null) session.setAttribute("regUser", regUser);
                else  regUser = (registeredUser)session.getAttribute("regUser");
                //getting the user type
                String userType = regUser.getUserType();
                
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                     <!-- checks for user type A, which is administrator-->
                    <% if (userType.equals("A")) { %>
                        <a class="active" href="adminDashboardServlet">Dashboard</a>
                        <a href="main.jsp">Main Page</a>
                        <a href="IoTDevices">Devices</a>
                        <a href="LogoutServlet">Logout</a>
                    <% } else {%>
                        <a class="active" href="main.jsp">Main Page</a>
                        <a href="IoTDevices">Devices</a>
                        <a href="LogoutServlet">Logout</a>
                    <% } %> 
                </div>
            </div>
            <div class="container">
		<h1>Create New Staff Record</h1>
		<form method="post" action="staffCreateServlet">
			<table>
				<tr><td>First Name</td><td><input type="text" placeholder="Enter first name" name="fname"></td></tr>
                                <tr><td>Last Name</td><td><input type="text" placeholder="Enter last name" name="lname"></td></tr>
				<tr><td>Email</td><td><input type="text" placeholder="Enter email" name="email"></td><td><% if (regEmailError != null) { %> <%=regEmailError%> <%}%> <td></tr>
				<tr><td>Password</td><td><input type="password" placeholder="Enter password" name="password"><td><% if (regPasswordError != null) { %> <%=regPasswordError%> <%}%> <td></td></tr>
                                <tr><td>Mobile</td><td><input type="tel" placeholder="Enter mobile" name="mobile"></td><td><% if (regMobileError != null) { %> <%=regMobileError%> <%}%><td></tr>
                                <tr><td>E-Contact</td><td><input type="text" placeholder="Enter contact name" name="ecantact"></td></tr>
                              
                                <tr><td><input class="button" type="submit" value="Create"></td><td><% if (regError != null) { %> <%=regError%> <%}%><% if (userExistError != null) { %> <%=userExistError%> <%}%><td></tr>
			</table>
		</form>
<<<<<<< HEAD
                <a class="button" href="staffmanage.jsp">Cancel</a>  
=======
                <a class="button" href="staffmanage.jsp">Cancel</a>
>>>>>>> origin/Luke
            </div>
	</body>
</html>
