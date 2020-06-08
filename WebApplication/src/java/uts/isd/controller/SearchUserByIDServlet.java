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
public class SearchUserByIDServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
    
            HttpSession session = request.getSession();
            String userid = request.getParameter("userid");
            session.setAttribute("user", null);
            
            //not logged in
            if(session.getAttribute("regUser")==null){
                System.out.println("Login first!");
                session.setAttribute("cusEditError", "Login first");
                request.getRequestDispatcher("login.jsp").include(request, response);
                return;
            }
            
            //user id is null
            if(userid == null || userid.length() == 0 || userid.trim().equals("")){
                System.out.println("UserID can not be null");
                session.setAttribute("cusEditError", "Userid can not be null");
                request.getRequestDispatcher("cusmanage.jsp").include(request, response);
                return;
            } 
            try {
                    
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                
                // User does not exist
                if(!userdao.userIDExists(Integer.parseInt(userid))){
                    System.out.println("User do not exist!");
                    session.setAttribute("cusEditError", "User do not exist!");
                    request.getRequestDispatcher("cusmanage.jsp").include(request, response);
                    
                  }
                 registeredUser tmp = userdao.selectUserById(Integer.parseInt(userid));
                //if userID is null    
                if(userid == null){
                    System.out.print("Not found");
                    session.setAttribute("cusEditError", "User not found");
                    request.getRequestDispatcher("cusmanage.jsp").include(request, response);
                       
                    }
                //no error occured 
                else{  
                    
                    session.setAttribute("user", tmp);
                    session.setAttribute("cusEditError", "Search successful");
                    request.getRequestDispatcher("cusmanage.jsp").include(request, response);
                }
                  connector.closeConnection();
            
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(SearchUserByIDServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(SearchUserByIDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
          
            }

}
