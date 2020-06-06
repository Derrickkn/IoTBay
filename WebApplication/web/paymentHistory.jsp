<%-- 
    Document   : paymentHistory
    Created on : 04/06/2020, 7:08:39 PM
    Author     : bappa
--%>

<%@page import="uts.isd.model.registeredUser"%>
<%@page import="uts.isd.model.payment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <title>Your Payments</title>
        <style>
            .paymentlogs {
                width: 40%;
                border-left: 10px solid #8f969c;
                padding: 0 1%;
                margin: 1% auto;
                border-radius: 5px;
                background-color: #657078;

            }
            h3, span, p, h5, label {
                color:white;
            }
            hr {
                background-color:grey;
            }
        </style>
        <%
            String noPayment = ((String) session.getAttribute("nopayment") == null) ? "" : (String) session.getAttribute("nopayment");
            ArrayList<payment> payment = (ArrayList<payment>) session.getAttribute("paymentHistory");
            registeredUser regUser = (registeredUser) session.getAttribute("regUser");
            String emptyfield = ((String) session.getAttribute("fielderr") == null) ? "" : (String) session.getAttribute("fielderr");
            boolean arrayempty = (Boolean) session.getAttribute("arrayempty");
            String error = ((String) session.getAttribute("searchpaymenterr") == null) ? "" : (String) session.getAttribute("searchpaymenterr");
            int count = 1;
        %>
    </head>
    <body> <div class="header">
            <a href="#default" class="logo">&#10070 &#8464oTBay</a>
            <div class="header-right">
                <a class="active" href="viewPaymentServlet"><span class="fa fa-credit-card"></span></a>
                <a href="main2.jsp">Main Page</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>            
        <div class="container">
            <% if (regUser != null) { %>
            <center><h3>Your Payment History</h3></center>
                <%if (regUser.getPaymentMethod().equals("Mastercard")) {%>
            <center><span class="fa fa-cc-mastercard" style="font-size:36px"></span></center>
                <% } else if (regUser.getPaymentMethod().equals("Visa")) { %>
            <center><span class="fa fa-cc-visa" style="font-size:36px"></span></center>
                <% } else if (regUser.getPaymentMethod().equals("American Express")) {%>
            <center><span class="fa fa-cc-amex" style="font-size:36px"></span></center>
                <% } else { %>
            <center><p>No Payment Method saved</p></center>
                <%  }%>
                <%if (regUser.getPaymentDetail().length() != 0) {%>
            <center><p><%=regUser.getPaymentDetail()%></p></center>
                    <% }%>
            <center><h5><%= emptyfield%></h5></center>
            <hr>
            <form method="post" action="specificpayServlet">
                <center><h5 style="color:orange;"><%=emptyfield%></h5></center>
                <center><h5 style="color:orange;"><%=error%></h5></center>
                <h5>Looking for a specific purchase?</h5>
                <div class="form-group">
                    <label for="paymentid">Payment ID</label>
                    <input type="text" placeholder="e.g. 189" class= "form-control" name="paymentid" id="paymentid">
                </div>
                <div class="form-group">
                    <label for="date">Date</label>
                    <input type="text" placeholder= "please enter date e.g. yyyy-mm-dd" class= "form-control" name="date" id="date">
                </div>
                <input type="hidden" name="userID" value="<%=regUser.getUserID()%>"/>
                <input type="hidden" name="cardNo" value="<%=regUser.getPaymentDetail()%>"/>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <hr>
            <%if (arrayempty) {%>
            <center><h5><%= noPayment%></h5></center>   
                    <% } else if (!arrayempty) {%>
                    <% for (payment pay : payment) {%>
            <div class="paymentlogs">
                <p>PaymentID : <%=pay.getPaymentID()%></p>
                <p>OrderID : <%=pay.getOrderID()%></p>
                <p><span class="fa fa-cc-visa" style="font-size:24px; margin:0 1px;"></span><span class="fa fa-cc-mastercard" style="font-size:24px;margin:0 1px;"></span><span class="fa fa-cc-amex" style="font-size:24px; margin:0 1px;"></span> : <%=pay.getMethod()%></p>
                <p><span class="fa fa-credit-card-alt" style="font-size:24px"></span> : <%=pay.getCardNo()%></p>
                <p><span class="fa fa-calendar" style="font-size:24px"></span> : <%=pay.getDatepaid()%></p>
            </div>
            <%
                            count += 1;
                        }
                    }
                }
            %>
        </div>
    </body>
</html>
