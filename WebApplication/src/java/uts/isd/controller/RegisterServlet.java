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
import uts.isd.model.dao.DBManager;
import uts.isd.model.dao.UserDao;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        
        
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            UserDao userdao = new UserDao(conn);
            userdao.addRegisteredUser(email, password, mobile, fname, lname);
            registeredUser = userdao.getUser(email, password);
            connector.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

            if (registeredUser != null) {
                session.setAttribute("regUser", registeredUser);
                request.getRequestDispatcher("main2.jsp").include(request, response);
            }
            else {
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
  
        }

    
}
