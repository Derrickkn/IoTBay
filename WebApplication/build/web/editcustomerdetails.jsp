<%-- 
    Document   : editcustomerdetails
    Created on : 02/06/2020, 9:11:03 PM
    Author     : Derrick
--%>

<%@page import="java.util.List"%>
<%@page import="uts.isd.model.order"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String editError = (String) session.getAttribute("editError"); %>
<% String editEmailError = (String) session.getAttribute("editEmailError"); %>
<% String editMobileError = (String) session.getAttribute("editMobileError"); %>
<% String userExistError = (String) session.getAttribute("userExistError"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>Main Page</title>
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
            String firstName = regUser.getFirstName();
            String lastName = regUser.getLastName();
            String email = regUser.getEmail();
            String password = regUser.getPassword();
            String mobile = regUser.getMobile();
            String savedAddress = regUser.getSavedAddress();
            String paymentMethod = regUser.getPaymentMethod();
            String paymentDetail = regUser.getPaymentDetail();
            if (savedAddress == null) {
                savedAddress = "";
            }
            if (paymentMethod == null) {
                paymentMethod = "";
            }
            if (paymentDetail == null) {
                paymentDetail = "";
            }
        %>
        <div class="container">
            <h1>Edit Customer Details</h1>
            <form method="post" action="EditServlet">
                <table>
                    <tr><td>First Name*</td><td><input type="text" placeholder="Enter name" name="fname" value="<%=firstName%>"></td></tr>
                    <tr><td>Last Name*</td><td><input type="text" placeholder="Enter name" name="lname" value="<%=lastName%>"></td></tr>
                    <tr><td>Email*</td><td><input  type="text" placeholder="Enter email" name="email" value="<%=email%>"></td></tr>
                    <tr><td>Password*</td><td><input type="password" placeholder="Enter password" name="password" value="<%=password%>"> </td></tr>
                    <tr><td>Mobile*</td><td><input type="tel" placeholder="Enter mobile" name="mobile" value="<%=mobile%>"></td></tr>
                    <tr><td>Address</td><td><input type="text" placeholder="Enter Address" name="savedAddress" value="<%=savedAddress%>"></td></tr>
                    <tr <% if (paymentMethod.equals("Paypal")) { %> style='display:none' <% } %>><td>Payment Detail</td><td><input type="text" placeholder="Enter Payment Details" name="paymentDetail" value="<%=paymentDetail%>"></td></tr>
                    <tr><td>Payment Method</td>
                        <td><select name="paymentMethod" id="cars">
                                <option value="Visa" <% if (paymentMethod.equals("Visa")) { %> selected <% } %>>Visa</option>
                                <option value="Mastercard" <% if (paymentMethod.equals("Mastercard")) { %> selected <% } %> >Mastercard</option>
                                <option value="Paypal" <% if (paymentMethod.equals("Paypal")) { %> selected <% } %>>Paypal</option>
                            </select>
                        </td></tr>
                    <tr><td colspan='2'><% if (editError != null) {%> <%=editError%><%}%><% if (editMobileError != null) {%><%=editMobileError%><%}%><% if (editEmailError != null) {%><%=editEmailError%><%}%><% if (userExistError != null) {%><%=userExistError%><%}%><td></tr>
<<<<<<< HEAD
                    <tr><td><a class="button" href="main.jsp">Cancel</a></td><td><input class="button" type="submit" value="Save Changes"></td>
                    <td><a class="button" href="deactivateaccount.jsp">DECTIVATE THIS ACCOUNT</a></td><td>   
            </form>
        </div>
    </div>
</body>
=======
                    <tr><td><a class="button" href="main.jsp">Cancel</a></td><td><input class="button" type="submit" value="Save Changes"></td><td>
            </form>
        </div>
    </body>
>>>>>>> origin/Luke
</html>
