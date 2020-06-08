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
public class cusDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession();
         String userid = request.getParameter("userid");
         try {
            
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            UserDao userdao = new UserDao(conn);

            userdao.deleteRegisteredUser(Integer.parseInt(userid));
            session.setAttribute("cusEditError", "User Deleted!");
            request.getRequestDispatcher("cusmanage.jsp").include(request, response);
            connector.closeConnection();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cusDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cusDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            //request.getRequestDispatcher("cusmanage.jsp").include(request, response);
      }
}
