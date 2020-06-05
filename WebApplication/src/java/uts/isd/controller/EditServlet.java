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
        session.setAttribute("editError", null);
        session.setAttribute("editMobileError", null);
        session.setAttribute("editEmailError", null);
        session.setAttribute("userExistError", null);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("savedAddress");
        String pamynetDetail = request.getParameter("paymentDetail");
        String paymentMethod = request.getParameter("paymentMethod");
        if (validator.isFieldEmpty(email) || validator.isFieldEmpty(password) || validator.isFieldEmpty(mobile) || validator.isFieldEmpty(fname) || validator.isFieldEmpty(lname)) {
            session.setAttribute("editError", "Please fill in all required fields.");
            request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);
        } else if (!validator.validateMobile(mobile)) {
            session.setAttribute("editMobileError", "Please enter a valid number");
            request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("editEmailError", "Please enter a valid email address");
            request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);
        } else {
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                UserDao userdao = new UserDao(conn);
                registeredUser currentDetails = (registeredUser) session.getAttribute("regUser");
                if (!userdao.userExists(email) || currentDetails.getEmail().equals(email)) {
                    userdao.updateAll((int) session.getAttribute("userID"), fname, lname, email, password, mobile, address, pamynetDetail, paymentMethod);
                    registeredUser registeredUser = userdao.getUser(email, password);
                    session.setAttribute("regUser", registeredUser);
                    connector.closeConnection();
                    request.getRequestDispatcher("main2.jsp").include(request, response);

                } else {
                    session.setAttribute("userExistError", "Email address already taken!");
                    request.getRequestDispatcher("editcustomerdetails.jsp").include(request, response);

                }
            } catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
