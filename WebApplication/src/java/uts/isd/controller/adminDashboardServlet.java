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
 * @author silve
 */
public class adminDashboardServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminDashboardServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminDashboardServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            registeredUser regUser = null;
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String userType = regUser.getUserType();
            
        try {
            
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            UserDao userdao = new UserDao(conn);
            regUser = userdao.getUser(email, password);
            request.getRequestDispatcher("admindashboard.jsp").include(request, response);
            
            if (regUser != null && regUser.isActivated() && userType.equals("A")){
                
                session.setAttribute("regUser", regUser);
                session.setAttribute("userID", regUser.getUserID());
                session.setAttribute("allUsers", userdao.getAllUsers());
                request.getRequestDispatcher("admindashboard.jsp").include(request, response);
               
            }
            
            else if (regUser != null && !regUser.isActivated()) {
                    session.setAttribute("deactivatedError", "This account has been deactivated, please contact our support team to reactivate your account.");
                }
            
             else if (regUser != null && regUser.isActivated() && !userType.equals("A")) {
                    session.setAttribute("notAdminError", "This account is not an administrator account, access denied");
                }
            else {
                    request.getRequestDispatcher("main.jsp").include(request, response);
                }
            
            connector.closeConnection();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminDashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(adminDashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         processRequest(request, response);
         
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
