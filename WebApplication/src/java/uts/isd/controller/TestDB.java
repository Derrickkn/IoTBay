package uts.isd.controller;
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.model.registeredUser;


public class TestDB {
    
    private static Scanner in = new Scanner(System.in);
    
    public static void main(String[] args) {
       
    try {

        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        
        registeredUser customer = db.Login("O.McNair@gmail.com", "yS2EgwWF");
        System.out.println(customer.getFirstName());
        System.out.println(customer.getLastName());
        System.out.println(customer.getEmail());
        System.out.println(customer.getPassword());
        connector.closeConnection();

    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

}