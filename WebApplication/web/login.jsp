<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String loginError = (String) session.getAttribute("loginError"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Login Page</title>
	</head>
	<body>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            </div>
            <div class="container">
		<h1>Log In</h1>
		<form method="post" action="LoginServlet">
			<table>
				<tr><td>Email</td><td><input type="text" placeholder="Enter email" name="email"></td></tr>
				<tr><td>Password</td><td><input type="password" placeholder="Enter password" name="password"></td></tr>
                                <tr><td><input class="button" type="submit" value="Log In"></td><td><% if (loginError != null) { %> <%=loginError%> <%}%> <td></tr>
			</table>
                    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
		</form>
            </div>
	</body>
</html>