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

/**
 *
 * @author Kira
 */
public class staffDeleteServlet extends HttpServlet {

    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession();
         try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                
                //String id = request.getParameter("StaffId");
                
                userdao.deleteStaff((int)session.getAttribute("StaffId"));

               

                connector.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(DeactivateAccServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(DeactivateAccServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
      
        request.getRequestDispatcher("deletestaff.jsp").include(request, response);
    }


}
