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
import uts.isd.model.dao.OrderDao;
import uts.isd.model.registeredUser;
import uts.isd.model.dao.UserDao;
import uts.isd.model.order;

public class LoadOrderInfodServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        String orderid = request.getParameter("orderid");
        System.out.println(session.getAttribute("regUser"));
        session.setAttribute("order", null);
        //not login
        if(session.getAttribute("regUser")==null){
            System.out.println("Login first!");
            session.setAttribute("loadorderError", "Login first");
            request.getRequestDispatcher("login.jsp").include(request, response);
            return;
        }
        registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        if(orderid == null || orderid.length() == 0 || orderid.trim().equals("")){
            System.out.println("Orderid can not be null");
            session.setAttribute("loadorderError", "Orderid can not be null");
            request.getRequestDispatcher("/updateorder.jsp").include(request, response);
            return;
        }
        try {
            OrderDao orderdao = new OrderDao();
            // Order not exits
             if(!orderdao.orderexist(Integer.parseInt(orderid))){
                  System.out.println("Order do not exist!");
                  session.setAttribute("loadorderError", "Order do not exist!");
                  request.getRequestDispatcher("updateorder.jsp").include(request, response);
                  return;
             }
              order tmp = orderdao.selectOrderById(regUser.getUserID(),Integer.parseInt(orderid));
              if(tmp == null){
                  System.out.print("Not found");
                  session.setAttribute("loadorderError", "Order not found");
                  request.getRequestDispatcher("updateorder.jsp").include(request, response);
                  return;
              }
              
              session.setAttribute("order", tmp);
              session.setAttribute("loadorderError", "Search success");
              request.getRequestDispatcher("updateorder.jsp").include(request, response);
             
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoadOrderInfodServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoadOrderInfodServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
