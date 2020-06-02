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
import uts.isd.model.registeredUser;

public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("savedAddress");
        String pamynetDetail = request.getParameter("paymentDetail");
        String paymentMethod = request.getParameter("paymentMethod");
        
        try {
                    DBConnector connector = new DBConnector();
                    Connection conn = connector.openConnection();
                    UserDao userdao = new UserDao(conn);
                    userdao.updateAll((int)session.getAttribute("userID"), fname, lname, email, password, mobile, address, pamynetDetail, paymentMethod);
                    registeredUser registeredUser = userdao.getUser(email, password);
                    session.setAttribute("regUser", registeredUser);
                    connector.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }  
        request.getRequestDispatcher("main2.jsp").include(request, response);   
    }
        
    
}
