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
import uts.isd.model.dao.UserDao;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        session.setAttribute("loginError", null);
        
        if (validator.isLoginEmpty(email,password)) {
            session.setAttribute("loginError", "Please fill in all login fields!");
        }
        else if (!validator.validateEmail(email)) {
            session.setAttribute("loginError", "Please enter a valid email address!");
        }
        
        if (validator.isLoginEmpty(email,password) || !validator.validateEmail(email)) {
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        
        else {
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                registeredUser = userdao.getUser(email, password);
                if (registeredUser != null && registeredUser.isActivated()) { 
                    session.setAttribute("accessLogID", userdao.accessLogStart(registeredUser.getUserID()));
                    session.setAttribute("accessLogs", userdao.getAccessLogs(registeredUser.getUserID()));
                }
                else if (registeredUser != null && !registeredUser.isActivated()) {
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
                request.getRequestDispatcher("main.jsp").include(request, response);
            }
            
            else if (registeredUser == null ) {
                session.setAttribute("loginError", "Incorrect email or password!");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
            else {
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        }
    }
    
}
