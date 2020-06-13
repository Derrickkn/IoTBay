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
import uts.isd.model.staff;

/**
 *
 * @author Kira
 */
public class staffCreateServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        staff staff = null;
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String EContact = request.getParameter("econtact");

        session.setAttribute("regError", null);
        session.setAttribute("regEmailError", null);
        session.setAttribute("regPasswordError", null);
        session.setAttribute("regMobileError", null);
        session.setAttribute("userExistError", null);
        
        if (validator.isFieldEmpty(email) || validator.isFieldEmpty(password) || validator.isFieldEmpty(mobile) || validator.isFieldEmpty(fname) || validator.isFieldEmpty(lname)) {
            session.setAttribute("regError", "Please fill in all fields!");
        } else {
            if (!validator.validateEmail(email)) {
                session.setAttribute("regEmailError", "Invalid email format!");
            }
            if (!validator.validatePassword(password)) {
                session.setAttribute("regPasswordError", "Password must be more than 8 characters!");
            }
            if (!validator.validatePassword(password)) {
                session.setAttribute("regMobileError", "Please enter a valid number.");
            } else {
                try {
                    DBConnector connector = new DBConnector();
                    Connection conn = connector.openConnection();
                    UserDao userdao = new UserDao(conn);
                    if (!userdao.userExists(email)) {
                        userdao.addStaff(email, fname, lname, password, mobile, EContact);
                        staff = userdao.getStaff(email, password);
                    }
                    else {
                        session.setAttribute("userExistError", "User already exists!");
                    }
                    if (staff != null) {
                        session.setAttribute("accessLogID", userdao.accessLogStart(staff.getUserID()));
                        session.setAttribute("accessLogs", userdao.getAccessLogs(staff.getUserID()));
                        session.setAttribute("userID", staff.getUserID());
                    }
                    connector.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(staffCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(staffCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        if (staff == null) {
            request.getRequestDispatcher("staffcreate.jsp").include(request, response);
            session.setAttribute("regError", "Email address already exists!");
        }

        if (staff != null) {
            session.setAttribute("staff", staff);
            request.getRequestDispatcher("staffmanage.jsp").include(request, response);
        }
    }
    
}

