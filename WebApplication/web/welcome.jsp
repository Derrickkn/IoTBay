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

<%@page import="uts.isd.model.Customer"%>
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
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String gender = request.getParameter("gender");
            %> 
      
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="main.jsp">Mainpage</a>
                <a href="logout.jsp">Logout</a>
                </div>
            </div>
            <div class="container">

                <h1>Welcome <%= name%>!</h1>
                <p>Your email is: <%= email%></p>
                <p>Your password is: <%= password%></p>
                <p>Your DOB is: <%= dob%></p>
                <p>Your email is: <%= email%></p>
                <p>Your gender is: <%= gender%></p>
            </div>
                <%
                    Customer customer = new Customer (name, email, password, dob, gender);
                    session.setAttribute("customer", customer);
                %>
                
        </body>
</html>