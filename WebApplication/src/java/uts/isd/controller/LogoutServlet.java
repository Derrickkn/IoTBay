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
import uts.isd.model.dao.UserDao;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
            if (session.getAttribute("accessLogID") != null) {
                try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                //Set the time of the user's logout.
                userdao.accessLogEnd((int)session.getAttribute("accessLogID")); 
                connector.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        session.invalidate();//Delete the session.
        request.getRequestDispatcher("logout.jsp").include(request, response);
    }
}
