<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<form method="post" action="welcome.jsp">
			<table>
				<tr><td>Name</td><td><input type="text" placeholder="Enter name" name="name"></td></tr>
				<tr><td>Email</td><td><input type="text" placeholder="Enter email" name="email"></td></tr>
				<tr><td>Password</td><td><input type="password" placeholder="Enter password" name="password"></td></tr>
				<tr><td>Date of Birth</td><td><input type="date" name="dob"></td></tr>
                                <tr><td>Gender</td>
                                    <td><select id="gender" name="gender">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="unknown">Prefer not to say</option>
                                </select></td></tr>
                                <tr><td><input class="button" type="submit" value="Sign Up"></td></tr> 
			</table>
		</form>
                <p>Already have an account? <a href="login.jsp">Log In</a></p>
            </div>
	</body>
</html>