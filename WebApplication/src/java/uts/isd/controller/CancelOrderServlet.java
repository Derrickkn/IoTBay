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

public class CancelOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        String orderid = request.getParameter("orderid");
        //not login
        if(session.getAttribute("regUser")==null){
            System.out.println("Login first!");
            session.setAttribute("ordercancelError", "Login first");
            request.getRequestDispatcher("login.jsp").include(request, response);
            return;
        }
        registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        if(orderid == null || orderid.length() == 0 || orderid.trim().equals("")){
            System.out.println("Orderid can not be null");
            session.setAttribute("ordercancelError", "Orderid can not be null");
            request.getRequestDispatcher("/cancelorder.jsp").include(request, response);
            return;
        }
        try {
            OrderDao orderdao = new OrderDao();
            // Order not exits
             if(!orderdao.orderexist(Integer.parseInt(orderid))){
                  System.out.println("Order do not exist!");
                  session.setAttribute("ordercancelError", "Order do not exist!");
                  request.getRequestDispatcher("cancelorder.jsp").include(request, response);
                  return;
             }
             //Can only cancel self order
              if(!orderdao.isorderowner(regUser.getUserID(), Integer.parseInt(orderid))){
                  System.out.print("Can not cancel others order");
                  session.setAttribute("ordercancelError", "Can not cancel others order!");
                  request.getRequestDispatcher("cancelorder.jsp").include(request, response);
                  return;
              }
              if(!orderdao.cancelOrderByOrderId(Integer.parseInt(orderid))){
                  System.out.print("Cancel fails");
                  session.setAttribute("ordercancelError", "Already submit, can not cancel");
                  request.getRequestDispatcher("cancelorder.jsp").include(request, response);
                  return;
              }
              session.setAttribute("ordercancelError", "Cancel success");
              request.getRequestDispatcher("cancelorder.jsp").include(request, response);
             
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CancelOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CancelOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
