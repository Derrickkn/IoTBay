package uts.isd.controller;

import java.io.IOException;
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
import uts.isd.model.registeredUser;
import uts.isd.model.dao.UserDao;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        //Get registration form details.
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        //Set registration errors to null.
        session.setAttribute("regError", null);
        session.setAttribute("regEmailError", null);
        session.setAttribute("regPasswordError", null);
        session.setAttribute("regMobileError", null);
        session.setAttribute("userExistError", null);
        
        //If any login field is empty.
        if (validator.isFieldEmpty(email) || validator.isFieldEmpty(password) || validator.isFieldEmpty(mobile) || validator.isFieldEmpty(fname) || validator.isFieldEmpty(lname)) {
            session.setAttribute("regError", "Please fill in all fields!"); //Set empty error.
        } else { //If email address is of an invalid format
            if (!validator.validateEmail(email)) {
                session.setAttribute("regEmailError", "Invalid email format!");//Set email error.
            }
            if (!validator.validatePassword(password)) { //If password is less than 8 characters
                session.setAttribute("regPasswordError", "Password must be more than 8 characters!"); //Set password error
            }
            if (!validator.validateMobile(mobile)) { //If mobile format is invalid.
                session.setAttribute("regMobileError", "Please enter a valid number.");// Set mobile error.
            } else {
                try {
                    DBConnector connector = new DBConnector();
                    Connection conn = connector.openConnection();
                    UserDao userdao = new UserDao(conn);
                    //If user email does not already exists in the database, register the account.
                    if (!userdao.userExists(email)) {
                        userdao.addRegisteredUser(email, password, mobile, fname, lname);
                        registeredUser = userdao.getUser(email, password);
                    }
                    else {
                        session.setAttribute("userExistError", "User already exists!");
                    }
                    //If user was successfully created, set accesslogs.
                    if (registeredUser != null) {
                        session.setAttribute("accessLogID", userdao.accessLogStart(registeredUser.getUserID()));
                        session.setAttribute("accessLogs", userdao.getAccessLogs(registeredUser.getUserID()));
                        session.setAttribute("userID", registeredUser.getUserID());
                    }
                    connector.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        //If user was not created, email address was already taken.
        if (registeredUser == null) {
            request.getRequestDispatcher("register.jsp").include(request, response);
            session.setAttribute("regError", "Email address already exists!");
        }
        
        //If user is successfully created, redirect to main page.
        if (registeredUser != null) {
            session.setAttribute("regUser", registeredUser);
            request.getRequestDispatcher("main.jsp").include(request, response);
        }

    }

}
