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
public class cusCreateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        session.setAttribute("loginError", null);
        
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                registeredUser = userdao.getUser(email, password);
                
                if (registeredUser != null && !registeredUser.isActivated()) {
                    session.setAttribute("deactivatedError", "This account has been deactivated, please contact our support team to reactivate your account.");
                }
                connector.closeConnection();
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if (registeredUser != null && registeredUser.isActivated()) {
                session.setAttribute("regUser", registeredUser);
                session.setAttribute("userID", registeredUser.getUserID());
                request.getRequestDispatcher("cusmanage.jsp").include(request, response);
            }
            
            else if (registeredUser == null ) {
                session.setAttribute("loginError", "Incorrect email or password!");
                request.getRequestDispatcher("main.jsp").include(request, response);
            }
            else {
                request.getRequestDispatcher("cuscreate.jsp").include(request, response);
            }
        }
    }
    

