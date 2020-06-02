<%-- 
    Document   : personal edit page
    Created on : May 30, 2020, 8:53:01 PM
    Author     : Kira
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
		<h1>Edit your details</h1>
                <span><%= (updated != null) ? "Update successful.":""%></span>
		<form method="post" action="welcome.jsp">
			<table>
                            <tr><td>First Name</td><td><input type="text" placeholder="Enter name" name="fname" value="${fname.regUser}"></td></tr>
                                <tr><td>Last Name</td><td><input type="text" placeholder="Enter name" name="lname" value="${lname.regUser}"></td></tr>
				<tr><td>Email</td><td><input type="text" placeholder="Enter email" name="email" value="${email.regUser}"></td></tr>
				<tr><td>Password</td><td><input type="password" placeholder="Enter password" name="password" value="${email.password}"></td></tr>
                                <tr><td>Mobile</td><td><input type="tel" placeholder="Enter mobile" name="mobile" value="${email.mobile}"></td></tr>
                                <tr><td><a class="button" href="main.jsp">Cancel</a> 
                                        <input class="button" type="submit" value="Update">
                                        <input class="hidden" name="updated" value="Update">
                                    </td></tr>         
			</table>
		</form>
                                <%
                                    int UserID = Integer.parseInt(request.getParameter("UserID"));
                                    String firstName = request.getParameter("fname");
                                    String lastName = request.getParameter("lname");
                                    String email = request.getParameter("email");
                                    String password = request.getParameter("password");
                                    String mobile = request.getParameter("mobile");
                                    String userType = request.getParameter("userType");
                                    regUser = new registeredUser(UserID, password, firstName, lastName, email, mobile, userType);
                                    
                                 %>
            </div>
	</body>
</html>