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
<<<<<<< HEAD
<% registeredUser u = (registeredUser)session.getAttribute("user");  %>
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
		<title>Customer Record Management</title>
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
                <h1>Customer Record Management</h1>
                <table class="table">
                    <!-- table heater -->
                    <thead>
                        <th>User ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th> 
                        <th>User Type</th>
                    </thead>
          
                    <tbody> 
                         <%
                            //Gets the array of allUsers from UserDao and returns an array elements of each specified parameter.
                            ArrayList<registeredUser> allUsers = (ArrayList<registeredUser>)session.getAttribute("allUsers");
                            for (registeredUser x : allUsers) {
                                if (x.getUserType().equals("R")){ //Additianal check for userType "R" which is registered user.
                                
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
                        
                    </tbody>
                        <%                            
                        }}
                        %>
                </table>       
                <div class="left">
<<<<<<< HEAD
                     <table>
                     <tr>
                     <td>
                        <form method="post" action="SearchUserByIDServlet">
                            <p>Select user by ID to edit or remove: </p>
                           <label for="userID">User ID:</label>
                           <input type="text" id="userID" name="userid"><br><br>
                           <input class="button" type="submit" value="Edit/Delete">
                       </form>
                    </td>
                    </table>
                    <% String paymentMethod = regUser.getPaymentMethod();
                       String paymentDetail = regUser.getPaymentDetail();

                        if (paymentMethod == null) {
                            paymentMethod = "";
                        }
                        if (paymentDetail == null) {
                            paymentDetail = "";
                    }%>
                    <!-- form appears only id user id is selected-->
                    <% if(u != null ){ %>
                    <hr>
                    <h3>Selected Record</h3>
                    <table class="table">
                        <thead>
                            <th>User ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Password</th> 
                            <th>User Type</th>
                        </thead>
                        <tbody>
                            <tr>
                            <td><%=u.getUserID()%></td>
                            <td><%=u.getFirstName()%></td>
                            <td><%=u.getLastName()%></td>
                            <td><%=u.getEmail()%></td>
                            <td><%=u.getPassword()%></td>
                            <td><%=u.getUserType()%></td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <h3>Edit Customer Record</h3>
                    <form method="post" action="cusEditServlet">
                        <table>
                            <tr><td>User ID (read-only)</td><td><input type="text" placeholder="Enter name" name="userid" value="<%=u.getUserID()%>" readonly></td></tr>
                            <tr><td>First Name*</td><td><input type="text" placeholder="Enter name" name="fname" value="<%=u.getFirstName()%>"></td></tr>
                            <tr><td>Last Name*</td><td><input type="text" placeholder="Enter name" name="lname" value="<%=u.getLastName()%>"></td></tr>
                            <tr><td>Email*</td><td><input  type="text" placeholder="Enter email" name="email" value="<%=u.getEmail()%>"></td></tr>
                            <tr><td>Password*</td><td><input type="password" placeholder="Enter password" name="password" value="<%=u.getPassword()%>"> </td></tr>
                            <tr><td>Mobile*</td><td><input type="tel" placeholder="Enter mobile" name="mobile" value="<%=u.getMobile()%>"></td></tr>
                            <tr><td>Address</td><td><input type="text" placeholder="Enter Address" name="savedAddress" value="<%=u.getSavedAddress()%>"></td></tr>
                    <tr <% if (paymentMethod.equals("Paypal")) { %> style='display:none' <% } %>><td>Payment Detail</td><td><input type="text" placeholder="Enter Payment Details" name="paymentDetail" value="<%=paymentDetail%>"></td></tr>
                    <tr><td>Payment Method</td>
                        <td><select name="paymentMethod" id="cars">
                                <option value="Visa" <% if (paymentMethod.equals("Visa")) { %> selected <% } %>>Visa</option>
                                <option value="Mastercard" <% if (paymentMethod.equals("Mastercard")) { %> selected <% } %> >Mastercard</option>
                                <option value="Paypal" <% if (paymentMethod.equals("Paypal")) { %> selected <% } %>>Paypal</option>
                            </select>
                        </td></tr>
                    <tr><td colspan='2'><% if (editError != null) {%> <%=editError%><%}%><% if (editMobileError != null) {%><%=editMobileError%><%}%><% if (editEmailError != null) {%><%=editEmailError%><%}%><% if (userExistError != null) {%><%=userExistError%><%}%><td></tr>
                    <tr><td><input class="button" type="submit" value="Save Changes"></td>
                        </table>
                    </form>
                    <form method="post" action="cusDeleteServlet">
                        <input type="hidden" placeholder="Enter name" name="userid" value="<%=u.getUserID()%>" readonly>
                        <input class="button" type="submit" value="DELETE RECORD">
                    </form> 
                    <% } %>
                    <a class="button" href="admindashboard.jsp">Cancel</a> <a class="button" href="cuscreate.jsp">Create New Record</a> 
=======
                     <a class="button" href="cuscreate.jsp">Create New Record</a>   
                     <form  method="post" action="editcustomerdetails.jsp">
                         <p>Select user by ID to modify</p>
                        <label for="userID">Staff ID:</label>
                        <input type="text" id="userID" name="userID"><br><br>
                        <input class="button" type="submit" value="Edit">
                    </form>
                   
                    <form method="post" action="cusDeleteServlet">
                         <p>Select user by ID to delete</p>
                        <label for="userID">Staff ID:</label>
                        <input type="text" id="userID" name="userID"><br><br>
                        <input class="button" type="submit" value="Delete">
                    </form>
                        
                    <a class="button" href="admindashboard.jsp">Cancel</a>         
>>>>>>> origin/Luke
                </div>
	</body>
</html>