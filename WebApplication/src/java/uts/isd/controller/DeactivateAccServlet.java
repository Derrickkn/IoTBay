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

public class DeactivateAccServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
                try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                
                //Deactivate the users account.
                userdao.deactivateAccount((int)session.getAttribute("userID"));

                connector.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(DeactivateAccServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(DeactivateAccServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
        session.invalidate();
        request.getRequestDispatcher("logout.jsp").include(request, response);
    }
}
