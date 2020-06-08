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
public class SearchStaffByIDServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
    
            HttpSession session = request.getSession();
            String staffid = request.getParameter("staffid");
            session.setAttribute("staff", null);
            
            //not logged in
            if(session.getAttribute("regUser")==null){
                System.out.println("Login first!");
                session.setAttribute("cusEditError", "Login first");
                request.getRequestDispatcher("login.jsp").include(request, response);
                return;
            }
            
            //staff id is null
            if(staffid == null || staffid.length() == 0 || staffid.trim().equals("")){
                System.out.println("StaffID can not be null");
                session.setAttribute("staffEditError", "Staffid can not be null");
                request.getRequestDispatcher("staffmanage.jsp").include(request, response);
                return;
            } 
            try {
                    
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                
                // User does not exist
                if(!userdao.staffIDExists(Integer.parseInt(staffid))){
                    System.out.println("Staff do not exist!");
                    session.setAttribute("staffEditError", "Staff do not exist!");
                    request.getRequestDispatcher("staffmanage.jsp").include(request, response);
                    
                  }
                 staff tmp = userdao.selectStaffById(Integer.parseInt(staffid));
                //if userID is null    
                if(staffid == null){
                    System.out.print("Not found");
                    session.setAttribute("staffEditError", "Staff not found");
                    request.getRequestDispatcher("staffmanage.jsp").include(request, response);
                       
                    }
                //no error occured 
                else{  
                    
                    session.setAttribute("staff", tmp);
                    session.setAttribute("staffEditError", "Search successful");
                    request.getRequestDispatcher("staffmanage.jsp").include(request, response);
                }
                  connector.closeConnection();
            
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(SearchUserByIDServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(SearchUserByIDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
          
            }

}
