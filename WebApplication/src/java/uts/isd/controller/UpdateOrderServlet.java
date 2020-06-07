package uts.isd.controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Device;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DeviceDao;
import uts.isd.model.dao.OrderDao;
import uts.isd.model.registeredUser;
import uts.isd.model.dao.UserDao;
import uts.isd.model.order;

public class UpdateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        String orderid = request.getParameter("orderid");
        String address = request.getParameter("address");
    
        // input null 
        if( address == null || orderid ==null || orderid.length()==0 || address.length()==0){
             System.out.println("DeviceID,Number,ShipmentAddress can not be null");
            session.setAttribute("updateorderError", "ShipmentAddress can not be null");
            request.getRequestDispatcher("/updateorder.jsp").include(request, response);
            return;
        }
        //not login
        if(session.getAttribute("regUser")==null){
            System.out.println("Login first!");
            session.setAttribute("updateorderError", "Login first");
            request.getRequestDispatcher("login.jsp").include(request, response);
            return;
        }
        registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        
        
        try {
            OrderDao orderDao = new OrderDao();
            boolean res = orderDao.updateShipmentAddress(Integer.parseInt(orderid), address);
            //update fail
            if(!res){
                System.out.println("Update fail!");
                session.setAttribute("updateorderError", "Update fail");
                request.getRequestDispatcher("updateorder.jsp").include(request, response);
                return;
            }
            //update success
            request.getRequestDispatcher("main.jsp").include(request, response);
           
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
       
    }
    
}
