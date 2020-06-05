<%-- 
    Document   : accesslogs.jsp
    Created on : 02/06/2020, 11:01:16 PM
    Author     : Derrick
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.accessLog"%>
<%@page import="java.util.ArrayList"%>
<% 
ArrayList<accessLog> accessLogs = (ArrayList<accessLog>)session.getAttribute("accessLogs"); 
int count = 1;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; carset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <title>Access Logs</title>
    </head>
    <body>
         <%
                registeredUser regUser = null;
                if(session.getAttribute("regUser")==null) session.setAttribute("regUser", regUser);
                else  regUser = (registeredUser)session.getAttribute("regUser");
                 String userType = regUser.getUserType();
         %>
        <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
             <div class="header-right">
                 <% if (userType.equals("A")) { %>
                     <a class="active" href="admindashboard.jsp">Dashboard</a>
                     <a href="main.jsp">Main Page</a>
                     <a href="LogoutServlet">Logout</a>
                <% } else {%>
                    <a class="active" href="main.jsp">Main Page</a>
                    <a href="LogoutServlet">Logout</a>
                <% } %> 
            </div>
        </div>
        <div class="container">
            <h1>Access Logs</h1>
            <table>
                <thead>
                    <th>Access #</th>
                    <th>Access Start</th>
                    <th>Access End</th>
                </thead>
                <% for (accessLog log : accessLogs) { %>
                <tr>
                    <td><%=count%></td>
                    <td><%=log.getLoginStart()%></td>
                    <td><% if (log.getLogoutEnd() != null) {
                    %><%=log.getLogoutEnd()%></td> <%}%>
                </tr>
                <% 
                    count += 1; } 
                %>
            </table>
            <div class="left">
                <a class="button" href="main.jsp">Go Back</a>
            </div>
        </div>
    </body>
</html>
