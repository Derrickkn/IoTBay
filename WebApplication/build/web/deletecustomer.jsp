<%-- 
    Document   : deletecustomer
    Created on : Jun 2, 2020, 2:23:21 PM
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
<<<<<<< HEAD
=======
            <%
                registeredUser regUser = (registeredUser)session.getAttribute("regUser");
                String updated  = request.getParameter("updated");
            %>
>>>>>>> origin/Luke
            <div class="header">
                <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            </div>
            <div class="container">
		<h2>Warning: you are going to delete this customer from the system. Proceed?</h2>
                <div class="left">
                    <a class="button" href="cusmanage.jsp">Cancel</a>
<<<<<<< HEAD
                    <a class="button" href="DeactivateAccServlet">DELETE CUSTOMER RECORD</a>    
=======
                    <a class="button" href="DeactivateAccServlet">DEACTIVATE ACCOUNT</a>    
>>>>>>> origin/Luke
                </div>
            </div>
	</body>
</html>
