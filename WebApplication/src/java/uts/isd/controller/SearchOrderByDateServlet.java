package uts.isd.controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
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

public class SearchOrderByDateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Enumeration e = session.getAttributeNames();
        System.out.println("---------------");
//        while(e.hasMoreElements()){
//          System.out.println(e.nextElement());
//       }
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        String date = request.getParameter("date");
        session.setAttribute("orders",null);
        //not login
        if(session.getAttribute("regUser")==null){
            System.out.println("Login first!");
            session.setAttribute("ordersearchError2", "Login first");
            request.getRequestDispatcher("login.jsp").include(request, response);
            return;
        }
        registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        if(date == null || date.length() == 0 || date.trim().equals("")){
            System.out.println("date can not be null");
            session.setAttribute("ordersearchError2", "date can not be null");
            request.getRequestDispatcher("/searchorder.jsp").include(request, response);
            return;
        }
        try {
              OrderDao orderdao = new OrderDao();
              //System.out.println("userid:"+regUser.getUserID()+"\tdate:"+date);
              List<order> tmp = orderdao.selectOrdersByDate(regUser.getUserID(),date);
             
              if(tmp == null || tmp.size()==0){
                  System.out.print("Not found");
                  session.setAttribute("ordersearchError2", "Order not found");
                  request.getRequestDispatcher("searchorder.jsp").include(request, response);
                  return;
              }
              session.setAttribute("orders", tmp);
              session.setAttribute("ordersearchError2", "Search success");
              request.getRequestDispatcher("searchorder.jsp").include(request, response);
              //response.sendRedirect("/searchorder.jsp");
             
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchOrderByDateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchOrderByDateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
