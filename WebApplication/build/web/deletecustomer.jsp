<%-- 
    Document   : deletecustomer
    Created on : Jun 2, 2020, 2:23:21 PM
    Author     : silve
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                String updated  = request.getParameter("updated");
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            </div>
            <div class="container">
		<h1>Customer deleted!</h1>
                <div class="left">
                    <a class="button" href="cusmanage.jsp">Back</a>       
                </div>
            </div>
	</body>
</html>
