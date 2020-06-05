<%-- 
    Document   : cancelorder
    Created on : 2020-5-31, 10:09:18
    Author     : HH
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.OrderDao"%>
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
        
         <%
            
            if(session.getAttribute("regUser") == null){
                 System.out.print("Login First");   
         %>
            <div class="container">
            <h3>Login First!</h3>
        </div>
         <%
             }
       
             else {
                     
                    registeredUser regUser = (registeredUser)session.getAttribute("regUser");
                    OrderDao orderdao = new OrderDao();
                    if(!orderdao.cancelOrderByUserId(regUser.getUserID())){
                      System.out.print("Cancel all order fails");  
                    %>
                        <div class="container">
                        <h3>Cancel Orders Fails!</h3>
                        </div>            
                    <%  
                    }
                    else{
                        System.out.print("Cancel all order success");
                     %>
                        <div class="container">
                        <h3>Cancel Orders Success!</h3>
                        </div>            
                    <%         
                    }
                
                }
         %>
         <div class="container">
             <a href="main.jsp" class="logo">Back</a>
        </div>
         
    </body>
</html>
