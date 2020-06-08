<%-- 
    Document   : deleteuser
    Created on : 08/06/2020, 3:27:31 PM
    Author     : luke.galic
--%>

<%@page import="uts.isd.model.unregisteredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>User Management</title>
	</head>
	<body>
            <%
                 unregisteredUser unregUser = null;
                if(session.getAttribute("unregUser")==null){
             
                    session.setAttribute("unregUser", unregUser);
                    
                }
                else
                    unregUser = (unregisteredUser)session.getAttribute("unregisteredUser");
                
            %>
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464IoTBay</a>
            </div>
            <div class="container">
                <h1>User deleted!</h1>
                
                <div class="left">
                    <a class="button" href="usermanage.jsp">Back</a>       
                </div>
	</body>
</html>
