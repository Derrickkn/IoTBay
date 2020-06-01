package uts.isd.controller;
import java.sql.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.model.dao.UserDao;
import uts.isd.model.registeredUser;



public class TestDB {
    
    public static void main(String[] args) {
       
    try {

        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        UserDao userdao = new UserDao(conn);
        
        
        registeredUser user = userdao.getUser("o.mcnair@gmail.com", "yS2EgwWF");
        System.out.println(user.getFirstName());
        
        userdao.addUser("testemail", "testpassword", "testmobile", "derrick", "nguyen");
        
        //registeredUser customer = db.getRegisteredUser("O.McNair@gmail.com", "yS2EgwWF");
        //System.out.println(customer.getFirstName());
        //System.out.println(customer.getLastName());
        //System.out.println(customer.getEmail());
        //System.out.println(customer.getPassword());
        connector.closeConnection();

    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

}