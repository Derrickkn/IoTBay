<%-- 
    Document   : registrationdetails
    Created on : 02/06/2020, 9:11:03 PM
    Author     : Derrick
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>Main Page</title>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
                <a class="active" href="main.jsp">Main Page</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
        <div class="container">
            <h1>DEACTIVATE ACCOUNT?</h1>
            <p>Are really sure you want to deactivate your account?</p>
            <p>Once your account is deactivated, you will no longer be able to login and make purchases.</p>
            <div class='left'>
                 <a class="button" href="editcustomerdetails.jsp">Cancel</a>
                 <a class="button" href="DeactivateAccServlet">DEACTIVATE MY ACCOUNT</a>
            </div>
        </div>
        </div>
    </body>
</html>