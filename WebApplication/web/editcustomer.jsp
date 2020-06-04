<%-- 
    Document   : editcustomer
    Created on : Jun 2, 2020, 2:21:36 PM
    Author     : Kira
--%>

<%@page import="java.util.List"%>
<%@page import="uts.isd.model.order"%>
<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String editError = (String)session.getAttribute("editError"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Edit your details</title>
	</head>
	<body>
            <%
                registeredUser regUser = (registeredUser)session.getAttribute("regUser");
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
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
                if (savedAddress == null) { savedAddress = ""; }
                if (paymentMethod == null) { paymentMethod = ""; }
                if (paymentDetail == null) { paymentDetail = ""; }
            %>
        <div class="container">
            <h1>Edit Customer Details</h1>
            <form method="post" action="EditServlet">
		<table>
                    <tr><td>First Name*</td><td><input type="text" placeholder="Enter name" name="fname" value="<%=firstName%>"></td></tr>
                    <tr><td>Last Name*</td><td><input type="text" placeholder="Enter name" name="lname" value="<%=lastName%>"></td></tr>
                    <tr><td>Email*</td><td><input type="text" placeholder="Enter email" name="email" value="<%=email%>"></td></tr>
                    <tr><td>Password*</td><td><input type="password" placeholder="Enter password" name="password" value="<%=password%>"> </td></tr>
                    <tr><td>Mobile*</td><td><input type="tel" placeholder="Enter mobile" name="mobile" value="<%=mobile%>"></td></tr>
                    <tr><td>Address</td><td><input type="text" placeholder="Enter Address" name="savedAddress" value="<%=savedAddress%>"></td></tr>
                    <tr><td>Payment Detail</td><td><input type="text" placeholder="Enter Payment Details" name="paymentDetail" value="<%=paymentDetail%>"></td></tr>
                    <tr><td>Payment Method</td><td><input type="text" placeholder="Enter Payment Method" name="paymentMethod" value="<%=paymentMethod%>"></td></tr>
                    <tr><td colspan='2'><% if (editError != null) { %> <%=editError%> <%}%><td></tr>
                    <tr><td><a class="button" href="main2.jsp">Cancel</a></td><td><input class="button" type="submit" value="Save Changes"></td><td>
                    <tr><td colspan="2"><a class="button" href="deactivateaccount.jsp">DEACTIVATE ACCOUNT</a></td></td></tr>
            </form>
        </div>
	</body>
</html>
