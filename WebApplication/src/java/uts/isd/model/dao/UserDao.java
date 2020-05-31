/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * @author Derrick
 */

package uts.isd.model.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import uts.isd.model.registeredUser;

public class UserDao {
    
    private Statement statement;
    
    public UserDao(Connection conn) throws ClassNotFoundException, SQLException {
        statement = conn.createStatement();
    }
    
    
    public void addUser(String email, String password, String mobile, String firstName, String lastName) throws SQLException {
        int userID = 9999;
        String unregisteredQuery = "INSERT INTO UnregisteredUser_Table (UserID, FName, LName, Email, Phone, UserType)";
        unregisteredQuery += "VALUES (" + userID + ", '" + firstName + "', '" + lastName + "', '" + email + "', '" + mobile + "', 'R')";
        statement.executeUpdate(unregisteredQuery);
        
        String registeredQuery = "INSERT INTO RegisteredUser_Table (UserID, Password, Activated)";
        registeredQuery += "VALUES (" + userID + ",'" + password + "',TRUE)";
        statement.executeUpdate(registeredQuery);
    }
    
    
    public boolean userExists(String email) throws SQLException {
        String query = "select * from unregistereduser_table natural join registereduser_table where upper(email) = " + "upper('" + email+ "')";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            return result.getString(4).toUpperCase().equals(email.toUpperCase());
        }
        return false;
    }
    
    public registeredUser getUser(String email, String password) throws SQLException {
        String query = "select * from unregistereduser_table natural join registereduser_table where upper(email) = " + "upper('" + email+ "')";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            if (result.getString(4).toUpperCase().equals(email.toUpperCase()) && result.getString(7).equals(password)) {
                int userID = result.getInt(1);
                String fName = result.getString(2);
                String lName = result.getString(3);
                String userEmail = result.getString(4);
                String mobile = result.getString(5);
                String userType = result.getString(6);
                String userPassword = result.getString(7);
                String paymentMethod = result.getString(8);
                String paymentDetail = result.getString(9);
                String savedAddress = result.getString(10);
                boolean activated = result.getBoolean(11);
                registeredUser registeredUser = new registeredUser(userID, userPassword, fName, lName, userEmail, mobile, userType);
                registeredUser.setPaymentMethod(paymentMethod);
                registeredUser.setPaymentDetail(paymentDetail);
                registeredUser.setSavedAddress(savedAddress);
                registeredUser.setActivated(activated);
                return registeredUser;
            }
        }
        return null;
    }
    

}
