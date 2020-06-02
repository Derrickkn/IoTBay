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
                    String orderid = request.getParameter("orderid");
                    //OrderID can not be empty
                    if( orderid ==null || orderid.equals("null") || orderid.length()==0){
                 
                        System.out.print("OrderID Can not Be Empty!");
                    %>
                               <div class="container">
                               <h3>OrderID Can not Be Empty!</h3>
                               </div>
                    <%
                     }
                     else{
                        OrderDao orderdao = new OrderDao();
                        
                        
                        // Order not exits
                        if(!orderdao.orderexist(Integer.parseInt(orderid))){
                            System.out.println("Order not exists!");
                         %>
                               <div class="container">
                               <h3>Order not exists!</h3>
                               </div>
                        <%
                        }
                        else{
                            //Can only cancel self order
                            if(!orderdao.isorderowner(regUser.getUserID(), Integer.parseInt(orderid))){
                                System.out.print("Can not cancel others order");
                            %>
                               <div class="container">
                               <h3>Can not cancel others order!</h3>
                               </div>
                            <%
                            }
                            else{
                                //success
                                if(orderdao.cancelOrderByOrderId(Integer.parseInt(orderid))){
                                    System.out.print("Cancel Success");
                                 %>
                                    <div class="container">
                                    <h3>Cancel Success!</h3>
                                    </div>
                                <%
                                }
                                //fail
                                else{
                                    System.out.print("Cancel Fails");
                                %>
                                    <div class="container">
                                    <h3>Cancel Fails!</h3>
                                    </div>
                                <%
                                }
                            }
                            }
                     }
                }
         %>
         <div class="container">
             <a href="main2.jsp" class="logo">Back</a>
        </div>
         
    </body>
</html>
