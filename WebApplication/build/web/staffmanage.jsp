<%-- 
    Document   : staffmanage
    Created on : Jun 2, 2020, 2:00:03 PM
    Author     : Kira
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.registeredUser"%>
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
                //getting user of the current session
                registeredUser regUser = null;
                if(session.getAttribute("regUser")==null) session.setAttribute("regUser", regUser);
                //getting the user type
                else  regUser = (registeredUser)session.getAttribute("regUser");
                   
                String userType = regUser.getUserType();
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <!-- administrator dashboard only displays when  administrator is logged in-->
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
                <h1>Staff Detail Management</h1>
                <table class="table">
                    <!-- table heater -->
                    <thead>
                        <th>Staff ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>User Type</th>
                    </thead>
                    <tbody>
                        <%
                            //Gets the array of allUsers from UserDao and returns an array elements of each specified parameter.
                            ArrayList<staff> allStaff = (ArrayList<staff>)session.getAttribute("allStaff");
                            for (staff x : allStaff) {
                                if (x.getUserType().equals("S")){ //Additianal check for userType "R" which is registered user.
                         %>
                        <!-- table row -->
                        <tr>
                            <!-- getting the individual parameters -->
                            <td><%=x.getUserID()%></td>
                            <td><%=x.getFirstName()%></td>
                            <td><%=x.getLastName()%></td>
                            <td><%=x.getEmail()%></td>
                            <td><%=x.getPassword()%></td>
                            <td><%=x.getUserType()%></td>
                        </tr>
                        <%                            
                            }}
                        %>
                    </tbody>
                </table>
               <div class="left">
                    <form method="post" action="staffEditServlet">
                        <p>Select user by ID to modify:</p>
                        <label for="userID">Staff ID:</label>
                        <input type="text" id="userID" name="userID"><br><br>
                        <input class="button" type="submit" value="Edit">
                    </form>
                    <form method="post" action="staffDeleteServlet">
                        <p>Select user by ID to remove:</p>
                        <label for="userID">Staff ID:</label>
                        <input type="text" id="userID" name="userID"><br><br>
                        <input class="button" type="submit" value="Delete">
                    </form>
                    <a class="button" href="admindashboard.jsp">Cancel</a>     
                </div>
	</body>
</html>