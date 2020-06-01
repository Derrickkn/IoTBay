<%-- 
    Document   : index
    Created on : May 2, 2020, 6:50:38 PM
    Author     : silve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Welcome Page</title>
	</head>
    <body>
        <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
                <div class="header-right">
                <a class="active" href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
                </div>
        </div>
        <div class="container">
            <h3>Welcome to IoYbay portal, please login or register to use it!</h3>
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
