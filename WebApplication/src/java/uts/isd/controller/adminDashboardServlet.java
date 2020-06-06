
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
public class adminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
    
            registeredUser regUser = (registeredUser) session.getAttribute("regUser");
            
        try {
            
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            UserDao userdao = new UserDao(conn);

            
            if (regUser.getUserType().equals("A")){
                
                session.setAttribute("regUser", regUser);
                session.setAttribute("userID", regUser.getUserID());
                session.setAttribute("allUsers", userdao.getAllUsers());
                session.setAttribute("allStaff", userdao.getAllStaff());
                request.getRequestDispatcher("admindashboard.jsp").include(request, response);
               
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
    }
}
