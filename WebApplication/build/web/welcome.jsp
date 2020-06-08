<%-- 
    Document   : welcome
    Created on : Apr 15, 2020, 16:20:46 PM
    Author     : Kira

      <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="main.jsp">Mainpage</a>
                <% if (user != null) { %>
                <% } else {%>
                    <a href="logout.jsp">Logout</a>
                <% } %>
                
                </div>
            </div>
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
                <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Welcome Page</title>
	</head>
	<body>
            <% 
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String mobile = request.getParameter("mobile");
                String savedAddress = request.getParameter("address");
            %> 
      
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="main.jsp">Mainpage</a>
                <a href="logout.jsp">Logout</a>
                </div>
            </div>
            <div class="container">

                <h1>Welcome <%= fname%>!</h1>
                <h1>Your last name is: <%= lname%></h1>
                <p>Your email is: <%= email%></p>
                <p>Your password is: <%= password%></p>
                <p>Your mobile is: <%= mobile%></p>
                <p>Your email is: <%= email%></p>
                <p>Your Shipment address is: <%= savedAddress%></p>
            </div>
                <%
                    registeredUser regUser = new registeredUser(fname, lname, email, mobile, password, savedAddress);
                    session.setAttribute("regUser", regUser);
                %>
                
        </body>
</html>