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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.UserDao;
import uts.isd.model.registeredUser;

/**
 *
 * @author Kira
 */
public class cusEditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        session.setAttribute("editError", null);
        session.setAttribute("editMobileError", null);
        session.setAttribute("editEmailError", null);
        session.setAttribute("userExistError", null);

        String userid = request.getParameter("userid");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("savedAddress");
        String pamynetDetail = request.getParameter("paymentDetail");
        String paymentMethod = request.getParameter("paymentMethod");
        if (validator.isFieldEmpty(email) || validator.isFieldEmpty(password) || validator.isFieldEmpty(mobile) || validator.isFieldEmpty(fname) || validator.isFieldEmpty(lname)) {
            session.setAttribute("editError", "Please fill in all required fields.");
            request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);
        } else if (!validator.validateMobile(mobile)) {
            session.setAttribute("editMobileError", "Please enter a valid number");
            request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("editEmailError", "Please enter a valid email address");
            request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);
        } else {
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                registeredUser currentDetails = (registeredUser) session.getAttribute("user");
                if (!userdao.userExists(email) || currentDetails.getEmail().equals(email)) {
                    userdao.updateAll(Integer.parseInt(userid), fname, lname, email, password, mobile, address, pamynetDetail, paymentMethod);
                    registeredUser tmp = userdao.getUser(email, password);
                    session.setAttribute("user", tmp);
                    
                    request.getRequestDispatcher("cusmanage.jsp").include(request, response);

                } else {
                    session.setAttribute("userExistError", "Email address already taken!");
                    request.getRequestDispatcher("cusmanage.jsp").include(request, response);
                }
                connector.closeConnection();
            } catch (SQLException ex) {
                Logger.getLogger(cusEditServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cusEditServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
