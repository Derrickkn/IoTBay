/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.PaymentDBManager;
import uts.isd.model.payment;
import uts.isd.model.registeredUser;

/**
 *
 * @author bappa
 */
public class viewPaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //retrieve regUser attribute
        registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        //declare and initializess cardNo with regUser attribute
        String cardNo = regUser.getPaymentDetail();
        //set sessions as null
        session.setAttribute("fielderr", null);
        session.setAttribute("paymentHistory", null);
        session.setAttribute("nopayment", null);
        session.setAttribute("arrayempty", true);
        //validate user input and check whether there are values in the strings
        if (cardNo.length() == 0 || cardNo.length()== 0) {
            session.setAttribute("fielderr", "You currently do not have a saved card number or method");
            request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
        } else {
            try {
                DBConnector connector;
                connector = new DBConnector();
                Connection conn = connector.openConnection();
                //creates paymentDBManager instance
                PaymentDBManager paymentDB = new PaymentDBManager(conn);
                //creates an arraylist to store all the payment history rseults
                ArrayList<payment> payment = paymentDB.fetchPayments(cardNo, regUser.getUserID());
                if (payment.size()== 0) {
                    //if arraysize is 0, it returns an error message
                    session.setAttribute("nopayment", "you have no purchase history");
                    request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
                } else {
                    //if arraysize is >0 is turns arrayempty attribute to false and saves arrayList to paymentHistory attribute
                    session.setAttribute("arrayempty", false);
                    session.setAttribute("paymentHistory", payment);
                    request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(viewPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(viewPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
