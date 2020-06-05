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
public class specificpayServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //retrieve value of fields inputted by user and hidden fields
        String payID = request.getParameter("paymentid");
        String specdate = request.getParameter("date");
        int ID = Integer.parseInt(request.getParameter("userID"));
        String cardNo = request.getParameter("cardNo");
        //set session attributes
        session.setAttribute("searchpaymenterr", null);   
        session.setAttribute("arrayempty", true);
        //create Validator instance
        Validator validate = new Validator();
        //validates whether fields are empty
        if (specdate.length() == 0 || payID.length() == 0) {
            session.setAttribute("searchpaymenterr", "Please fill in all fields");
            request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
            //validates the paymentID entered by user to make sure that it matches regular expression
        } else if (!validate.validatepaymentID(payID)) {
            session.setAttribute("searchpaymenterr", "please enter numbers for paymentID field");
            request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
            //validates the specific date entered by user to make sure that it matches regular expression and correct format
        } else if (!validate.validatedate(specdate)) {
            session.setAttribute("searchpaymenterr", "please enter correct date format e.g. 2020-12-04");
            request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
        } else {
            try {
                DBConnector connector;
                connector = new DBConnector();
                Connection conn = connector.openConnection();
                //creates an instance of PaymentDBManager
                PaymentDBManager paymentDB = new PaymentDBManager(conn);
                //creates an ArrayList for fetching specific payment entered by user
                ArrayList<payment> payment = paymentDB.fetchspecificpayment(cardNo, ID, Integer.parseInt(payID), specdate);
                if (payment.size() == 0) {
                    //validates whether there are any elements in payent arrayList and return an error message
                    session.setAttribute("nopayment", "you have no purchase history with payment ID: " + payID + " and date: " + specdate);
                    request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
                } else {
                    //if there are more than 0 elements in array, if true it sets arrayempty session variable to false and enters the arraylist into session variable
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
