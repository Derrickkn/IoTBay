<%-- 
    Document   : admindashboard
    Created on : Jun 2, 2020, 2:43:05 PM
    Author     : Kira
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Admin Dashboard</title>
	</head>
	<body>
            <%
                registeredUser regUser = null;
                if(session.getAttribute("regUser")==null) session.setAttribute("regUser", regUser);
                else  regUser = (registeredUser)session.getAttribute("regUser");
                   
                String userType = regUser.getUserType();    
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                 <div class="header-right">
                    <% if (userType.equals("A")) { %>
                        <a class="active" href="adminDashboardServlet">Dashboard</a>
                        <a href="main.jsp">Main Page</a>
                        <a href="LogoutServlet">Logout</a>
                   <% } else {%>
                       <a class="active" href="main.jsp">Main Page</a>
                       <a href="LogoutServlet">Logout</a>
                   <% } %> 
                </div>
            </div>
            <div class="container">
                <h1>Administrator Dashboard</h1>
                
                <div class="left">
                    <a class="button" href="cusmanage.jsp">Customer Management</a> <a class="button" href="staffmanage.jsp">Staff Management</a>       
                </div>
	</body>
</html>
