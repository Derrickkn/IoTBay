<%-- 
    Document   : deletecustomer
    Created on : Jun 2, 2020, 2:23:21 PM
    Author     : Kira
--%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
                <link rel="stylesheet" href="stylesheet.css">
		<title>Edit your details</title>
	</head>
	<body>
            <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
                <a class="active" href="admindashboard.jsp">Dashboard</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
            <div class="container">
		<h1>Warning: Customer will be deleted from the system.</h1>
                <div class="left">
                     <a class="button" href="cusmanage.jsp">Cancel</a> 
                    <a class="button" href="DeactivateAccServlet">Customer Deactivation</a>      
                </div>
            </div>
	</body>
</html>
