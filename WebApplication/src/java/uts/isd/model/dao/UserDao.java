/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * @author Derrick
 *  Edited by: Kira
 */

package uts.isd.model.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import uts.isd.model.accessLog;
import uts.isd.model.registeredUser;
import uts.isd.model.staff;

public class UserDao {

    public static void deleteRegisteredUser(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private Statement statement;
    
    public UserDao(Connection conn) throws ClassNotFoundException, SQLException {
        statement = conn.createStatement();
    }
    
    //Adds a user to the users database.
    public void addRegisteredUser(String email, String password, String mobile, String firstName, String lastName) throws SQLException {
        
        ResultSet result = statement.executeQuery("SELECT max(USERID) from unregistereduser_table");
        int userID = 0;
        while (result.next()) {
            userID = result.getInt(1) + 1;
        }
        
        //Query for adding a new row in the unregistered users table.
        String unregisteredQuery = "INSERT INTO UnregisteredUser_Table (UserID, FName, LName, Email, Phone, UserType)";
        unregisteredQuery += "VALUES (" + userID + ", '" + firstName + "', '" + lastName + "', '" + email + "', '" + mobile + "', 'R')";
        statement.executeUpdate(unregisteredQuery);
        
        //Query for adding a new row in the registered users table.
        String registeredQuery = "INSERT INTO RegisteredUser_Table (UserID, Password, Activated)";
        registeredQuery += "VALUES (" + userID + ",'" + password + "',TRUE)";
        statement.executeUpdate(registeredQuery);
    }
    
    public void addUnregisteredUser(String email, String mobile, String firstName, String lastName) throws SQLException {
        ResultSet result = statement.executeQuery("SELECT max(USERID) from unregistereduser_table");
        int userID = 0;
        while (result.next()) {
            userID = result.getInt(1) + 1;
        }
        
        String unregisteredQuery = "INSERT INTO UnregisteredUser_Table (UserID, FName, LName, Email, Phone, UserType)";
        unregisteredQuery += "VALUES (" + userID + ", '" + firstName + "', '" + lastName + "', '" + email + "', '" + mobile + "', 'U')";
        statement.executeUpdate(unregisteredQuery);
    }
    
    //Deletes a registered user by their userid.
    public void deleteRegisteredUser(int userID) throws SQLException {
        String query = "DELETE FROM registeredUser_Table where userid = " + userID;
        statement.executeUpdate(query);
    }
    
    //Deletes a registered user by their userid.
    public void deletesStaff(int staffID) throws SQLException {
        String query = "DELETE FROM staff_Table where userid = " + staffID;
        statement.executeUpdate(query);
    }
    
    //Checks whether a user exists in the database given their email address.
    public boolean userExists(String email) throws SQLException {
        String query = "select * from unregistereduser_table natural join registereduser_table where upper(email) = " + "upper('" + email+ "')";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            return result.getString(4).toUpperCase().equals(email.toUpperCase());
        }
        return false;
    }
    
    //Gets a User from the users database only if both email and password is correct. Returns a user(registereduser) as a bean.
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
    
    //Creates an access log given a users id.
    public int accessLogStart(int userID) throws SQLException {
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        
        ResultSet result = statement.executeQuery("SELECT max(accesslogid) from accesslog_table");
        int accessLogID = 0;
        while (result.next()) {
            accessLogID = result.getInt(1) + 1;
        }
        String query = "INSERT INTO AccessLog_Table (AccessLogID, UserID, LoginStart) VALUES  (" + accessLogID +" , " + userID + ",'" + timestamp + "')";
        statement.executeUpdate(query);
        return accessLogID;
    }
    
    public void accessLogEnd(int accessLogID) throws SQLException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String query = "UPDATE AccessLog_Table Set LoginEnd = '" + timestamp + "' WHERE AccessLogID = " + accessLogID + "";
        statement.executeUpdate(query);
    }
    
    public ArrayList<accessLog> getAccessLogs(int userID) throws SQLException {
        ArrayList<accessLog> arrayList = new ArrayList();
        String query = "SELECT * FROM ISDUSER.ACCESSLOG_TABLE WHERE USERID = " + userID;
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            accessLog log = new accessLog(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4));
            arrayList.add(log);
        }
        return arrayList;
    }
    
    public void updateAll(int userID, String firstName, String lastName, String email, String password, String mobile, String address, String paymentDetail, String paymentMethod) throws SQLException {
        String query1 = "UPDATE ISDUSER.UNREGISTEREDUSER_TABLE SET FNAME = '" + firstName + "', LNAME = '" + lastName + "', EMAIL = '" + email + "', Phone = '" + mobile + "' WHERE USERID = " + userID;
        String query2 = "UPDATE ISDUSER.REGISTEREDUSER_TABLE SET PASSWORD = '" + password + "', PAYMENTMETHOD = '" + paymentMethod + "', PAYMENT = '" + paymentDetail + "', SAVEDADDRESS = '" + address + "' WHERE USERID =" + userID;
        statement.executeUpdate(query1);
        statement.executeUpdate(query2);
    }
    
    public void deactivateAccount(int userID) throws SQLException {
        String query = "UPDATE ISDUSER.REGISTEREDUSER_TABLE SET ACTIVATED =  FALSE WHERE USERID = " + userID;
        statement.executeUpdate(query);
    }
    
    public ArrayList<registeredUser> getAllUsers() throws SQLException {
        ArrayList<registeredUser> arrayList = new ArrayList();
        String query = "select * from unregistereduser_table natural join registereduser_table";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
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
                arrayList.add(registeredUser);
        }
        return arrayList;
    }
    
     public ArrayList<staff> getAllStaff() throws SQLException {
        ArrayList<staff> arrayList = new ArrayList();
        String query = "select * from staff_table natural join unregistereduser_table";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
                int userID = result.getInt(1);
                String staffPassword = result.getString(2);
                String EContact = result.getString(3);
                String staffType = result.getString(4);
                String fName = result.getString(5);
                String lName = result.getString(6);
                String staffEmail = result.getString(7);       
                String phone = result.getString(8);
                String userType = result.getString(9);
                staff staff = new staff(staffPassword, staffType, userID, fName, lName, staffEmail, phone, userType);
                staff.setPassword(staffPassword);
                staff.setEmergencyContact(EContact);
                staff.setStaffType(staffType);
                arrayList.add(staff);
        }
        return arrayList;
    }
}
