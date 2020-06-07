package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.dao.UserDao;

/**
 *
 * @author Kira
 */
public class cusDeleteServlet extends HttpServlet {

   @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("userId");
        UserDao.deleteRegisteredUser(id);
        request.getRequestDispatcher("deletecustomer.jsp").include(request, response);
    }

}
