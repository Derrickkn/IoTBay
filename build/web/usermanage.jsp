<%-- 
    Document   : usermanage
    Created on : 08/06/2020, 2:48:15 PM
    Author     : luke.galic
--%>

<%@page import="uts.isd.model.staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.unregisteredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>User Record Management</title>
    </head>
    <body>
        <%
            //getting user of the current session
            registeredUser regUser = null;
            if (session.getAttribute("regUser") == null) {
                session.setAttribute("regUser", regUser);
            } else {
                regUser = (registeredUser) session.getAttribute("regUser");
            }
            //getting the user type
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
                <% } else { %>
                <a class="active" href="main.jsp">Main Page</a>
                <a href="IoTDevices">Devices</a>
                <a href="LogoutServlet">Logout</a>
                <% } %> 
            </div>
        </div>
        <div class="container">
            <h1>User Record Management</h1>
            <table class="table">
                <!-- table header -->
                <thead>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th> 
                <th>User Type</th>
                </thead>
                <tbody> 
                    <%
                        //Gets the array of all registered Users from UserDao and returns an array elements of each specified parameter.

                        ArrayList<unregisteredUser> allUsers = (ArrayList<unregisteredUser>)session.getAttribute("allUsers");
                        for (unregisteredUser u : allUsers) {
                            if (!u.getUserType().equals(null)) { //Check if user is empty

                    %>
                    <!-- table row -->
                    <tr>
                        <!-- getting the individual parameters -->
                        <td><%=u.getUserID()%></td>
                        <td><%=u.getFirstName()%></td>
                        <td><%=u.getLastName()%></td>
                        <td><%=u.getEmail()%></td>
                        <td><%=u.getMobile()%></td>
                        <td><%=u.getUserType()%></td>
                    </tr>
            <%
                    }
                }
            %>
                </tbody>
            </table>
            <table class="table">
                <!-- table header -->
                <thead>
                    <th>Staff ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>User Type</th>
                </thead>
                <tbody>
                    <%
                        //Gets the array of allUsers from UserDao and returns an array elements of each specified parameter.
                        ArrayList<staff> allStaff = (ArrayList<staff>)session.getAttribute("allStaff");
                        for (staff s : allStaff) {
                            if (s.getUserType().equals("S")) { //Additianal check for userType "R" which is registered user.
%>
                    <!-- table row -->
                    <tr>
                        <!-- getting the individual parameters -->
                        <td><%=s.getUserID()%></td>
                        <td><%=s.getFirstName()%></td>
                        <td><%=s.getLastName()%></td>
                        <td><%=s.getEmail()%></td>
                        <td><%=s.getMobile()%></td>
                        <td><%=s.getUserType()%></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table> 
            <div class="left">
                <!-- Cancel button and Create record buttons -->
                <a class="button" href="admindashboard.jsp">Cancel</a> <a class="button" href="cuscreate.jsp">Create New User Record</a>   <a class="button" href="staffcreate.jsp">Create New Staff Record</a>
                <!-- Edit User Button-->
                <form  method="post" action="edituserdetails.jsp">
                    <p>Edit User:</p>
                    <label for="userID">User ID:</label>
                    <input type="text" id="userID" name="userID"><br><br>
                    <input class="button" type="submit" value="Edit">
                </form>
                <!-- Delete User Button -->
                <form method="post" action="userDeleteServlet">
                    <p>Delete User:</p>
                    <label for="userID">User ID:</label>
                    <input type="text" id="userID" name="userID"><br><br>
                    <input class="button" type="submit" value="Delete">
                </form>
            </div>
        </div>
    </body>
</html>
