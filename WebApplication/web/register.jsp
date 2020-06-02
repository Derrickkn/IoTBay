<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String regError = (String) session.getAttribute("regError"); %>
<% String regEmailError = (String) session.getAttribute("regEmailError"); %>
<% String regPasswordError = (String) session.getAttribute("regPasswordError"); %>
<% String regMobileError = (String) session.getAttribute("regMobileError"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Registration Page</title>
	</head>
	<body>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            </div>
            <div class="container">
		<h1>Sign Up</h1>
		<form method="post" action="RegisterServlet">
			<table>
				<tr><td>First Name</td><td><input type="text" placeholder="Enter name" name="fname"></td></tr>
                                <tr><td>Last Name</td><td><input type="text" placeholder="Enter name" name="lname"></td></tr>
				<tr><td>Email</td><td><input type="text" placeholder="Enter email" name="email"></td><td><% if (regEmailError != null) { %> <%=regEmailError%> <%}%> <td></tr>
				<tr><td>Password</td><td><input type="password" placeholder="Enter password" name="password"><td><% if (regPasswordError != null) { %> <%=regPasswordError%> <%}%> <td></td></tr>
                                <tr><td>Mobile</td><td><input type="tel" placeholder="Enter mobile" name="mobile"></td><td><% if (regMobileError != null) { %> <%=regMobileError%> <%}%><td></tr>
                                <tr><td><input class="button" type="submit" value="Sign Up"></td><td><% if (regError != null) { %> <%=regError%> <%}%><td></tr> 
			</table>
		</form>
                <p>Already have an account? <a href="login.jsp">Log In</a></p>
            </div>
	</body>
</html>