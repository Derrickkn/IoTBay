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
<<<<<<< HEAD
<% staff s = (staff)session.getAttribute("staff");%>
<% String editError = (String) session.getAttribute("editError"); %>
<% String editEmailError = (String) session.getAttribute("editEmailError"); %>
<% String editMobileError = (String) session.getAttribute("editMobileError"); %>
<% String userExistError = (String) session.getAttribute("userExistError"); %>
=======
>>>>>>> origin/Luke
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Staff Record Management</title>
	</head>
	<body>
            <%
                //getting user of the current session
                registeredUser regUser = null;
                if(session.getAttribute("regUser")==null) session.setAttribute("regUser", regUser);
<<<<<<< HEAD
                else  regUser = (registeredUser)session.getAttribute("regUser");
                //getting the user type   
=======
                //getting the user type
                else  regUser = (registeredUser)session.getAttribute("regUser");
                   
>>>>>>> origin/Luke
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
                <h1>Staff Record Management</h1>
                <table class="table">
<<<<<<< HEAD
                    <!-- table header -->
=======
                    <!-- table heater -->
>>>>>>> origin/Luke
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
<<<<<<< HEAD
                          }}
                        %>
                    </tbody>
               </table>
               <div class="left">
                     <table>
                     <tr>
                     <td>
                        <form method="post" action="SearchStaffByIDServlet">
                            <p>Select staff by ID to edit or remove: </p>
                           <label for="">Staff ID:</label>
                           <input type="text" id="staffid" name="staffid"><br><br>
                           <input class="button" type="submit" value="Edit/Delete">
                       </form>
                    </td>
                     </table>
                    <!-- form appears only if staff id is selected-->
                    <% if(s != null ){ %>
                    <hr>
                    <h3>Selected Record</h3>
                    <table class="table">
                        <thead>
                            <th>Staff ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Password</th> 
                            <th>Mobile</th>
                            <th>Staff Type</th>
                        </thead>
                        <tbody>
                            <tr>
                            <td><%=s.getUserID()%></td>
                            <td><%=s.getFirstName()%></td>
                            <td><%=s.getLastName()%></td>
                            <td><%=s.getEmail()%></td>
                            <td><%=s.getPassword()%></td>
                            <td><%=s.getMobile()%></td>
                            <td><%=s.getStaffType()%></td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <h3>Edit Staff Record</h3>
                    <form method="post" action="staffEditServlet">
                        <table>
                            <tr><td>Staff ID (read-only)</td><td><input type="text" placeholder="Enter name" name="userid" value="<%=s.getUserID()%>" readonly></td></tr>
                            <tr><td>First Name*</td><td><input type="text" placeholder="Enter name" name="fname" value="<%=s.getFirstName()%>"></td></tr>
                            <tr><td>Last Name*</td><td><input type="text" placeholder="Enter name" name="lname" value="<%=s.getLastName()%>"></td></tr>
                            <tr><td>Email*</td><td><input  type="text" placeholder="Enter email" name="email" value="<%=s.getEmail()%>"></td></tr>
                            <tr><td>Password*</td><td><input type="password" placeholder="Enter password" name="password" value="<%=s.getPassword()%>"> </td></tr>
                            <tr><td>Mobile*</td><td><input type="tel" placeholder="Enter mobile" name="mobile" value="<%=s.getMobile()%>"></td></tr>
                            <tr><td>Staff Type</td><td><input type="text" placeholder="Enter Address" name="savedAddress" value="<%=s.getStaffType()%>"></td></tr>
                            <tr><td colspan='2'><% if (editError != null) {%> <%=editError%><%}%><% if (editMobileError != null) {%><%=editMobileError%><%}%><% if (editEmailError != null) {%><%=editEmailError%><%}%><% if (userExistError != null) {%><%=userExistError%><%}%><td></tr>
                            <tr><td><input class="button" type="submit" value="Save Changes"></td>
                        </table>
                    </form>
                    <form method="post" action="staffDeleteServlet">
                        <input type="hidden" placeholder="Enter name" name="userid" value="<%=s.getUserID()%>" readonly>
                        <input class="button" type="submit" value="DELETE RECORD">
                    </form> 
                    <% } %>
                    <a class="button" href="admindashboard.jsp">Cancel</a> <a class="button" href="cuscreate.jsp">Create New Record</a> 
=======
                            }}
                        %>
                    </tbody>
                </table>
               <div class="left">
                    <a class="button" href="staffcreate.jsp">Create New Record</a>   
                    <form method="post" action="editstaff.jsp">
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
>>>>>>> origin/Luke
                </div>
	</body>
</html>