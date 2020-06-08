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

public class CreateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        registeredUser registeredUser = null;
        Validator validator = new Validator();
        String deviceid = request.getParameter("deviceid");
        String number = request.getParameter("number");
        String address = request.getParameter("address");
        // input null 
        if(deviceid == null || number == null || address == null || deviceid.length()==0 || number.length()==0 || address.length()==0){
             System.out.println("DeviceID,Number,ShipmentAddress can not be null");
            session.setAttribute("createorderError", "DeviceID,Number,ShipmentAddress can not be null");
            request.getRequestDispatcher("/createorder.jsp").include(request, response);
            return;
        }
        //not login
        if(session.getAttribute("regUser")==null){
            System.out.println("Login first!");
            session.setAttribute("createorderError", "Login first");
            request.getRequestDispatcher("login.jsp").include(request, response);
            return;
        }
        registeredUser regUser = (registeredUser) session.getAttribute("regUser");
        
        
        try {
            DeviceDao deviceDao = new DeviceDao(new DBConnector().openConnection());
            List<Device> res = deviceDao.getAllDevices();
            // deviceid not exist
            Device chosedevice = null;
            for(Device d:res){
                if(d.getId()==Integer.parseInt(deviceid)){
                    chosedevice = d;
                    break;
                }
            }
            if(chosedevice == null){
                System.out.println("Device ID not exist");
                session.setAttribute("createorderError", "Device ID not exist");
                request.getRequestDispatcher("/createorder.jsp").include(request, response);
                return;
            }
            
            //create new order 
            OrderDao orderDao = new OrderDao();
            int orderid = orderDao.getLastOrderId()+1;
            int trackid = orderDao.getLastTrackingNumber()+1;
            double cost = chosedevice.getPrice()*Integer.parseInt(number);
            order tmp = new order(orderid,regUser.getUserID(),null,false,address,(float)cost,null,0);
            tmp.setTrackingNo(trackid);
            boolean res2 = orderDao.createOrder(tmp);
            //create fail
            if(!res2){
                System.out.println("Create order fails");
                session.setAttribute("createorderError", "Create order fails");
                request.getRequestDispatcher("/createorder.jsp").include(request, response);
            }
            else{
                 System.out.println("Create success");
                session.setAttribute("createorderError", "Create success");
                request.getRequestDispatcher("/main.jsp").include(request, response);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(CreateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    
}
