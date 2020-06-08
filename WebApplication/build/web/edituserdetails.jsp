<%-- 
    Document   : edituserdetails
    Created on : 08/06/2020, 4:08:16 PM
    Author     : luke.galic
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.unregisteredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String editError = (String) session.getAttribute("editError"); %>
<% String editEmailError = (String) session.getAttribute("editEmailError"); %>
<% String editMobileError = (String) session.getAttribute("editMobileError"); %>
<% String userExistError = (String) session.getAttribute("userExistError"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //getting user of the current session
            unregisteredUser unregUser = null;
            unregUser = (unregisteredUser)session.getAttribute("unregUser");
            //getting the user type
            //String userType = unregUser.getUserType();
           
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
                <a href="IoTDevices">Devices</a>
                <a href="main.jsp">Main Page</a>
                <a href="LogoutServlet">Logout</a>
                <% } else {%>
                <a class="active" href="main.jsp">Main Page</a>
                <a href="IoTDevices">Devices</a>
                <a href="LogoutServlet">Logout</a>
                <% } %> 
            </div>
        </div>
        <%
            //Obtain User information from database
            String firstName = unregUser.getFirstName();
            String lastName = unregUser.getLastName();
            String email = unregUser.getEmail();
            String mobile = unregUser.getMobile();
        %>
        <div class="container">
            <!-- Edit Form -->
            <h1>Edit User Record</h1>
            <form method="post" action="userEditServlet">
                <!-- Puts placeholder of current user's details -->
                <table>
                    <tr><td>First Name*</td><td><input type="text" placeholder="Enter name" name="fname" value="<%=firstName%>"></td></tr>
                    <tr><td>Last Name*</td><td><input type="text" placeholder="Enter name" name="lname" value="<%=lastName%>"></td></tr>
                    <tr><td>Email*</td><td><input  type="text" placeholder="Enter email" name="email" value="<%=email%>"></td></tr>
                    <tr><td>Mobile*</td><td><input type="tel" placeholder="Enter mobile" name="mobile" value="<%=mobile%>"></td></tr>
                    <tr><td colspan='2'><% if (editError != null) {%> <%=editError%><%}%><% if (editMobileError != null) {%><%=editMobileError%><%}%><% if (editEmailError != null) {%><%=editEmailError%><%}%><% if (userExistError != null) {%><%=userExistError%><%}%><td></tr>
                    <tr><td><a class="button" href="admindashboard.jsp">Cancel</a></td><td><input class="button" type="submit" value="Save Changes"></td><td>
                </table>
            </form>
        </div>
    </body>
</html>
