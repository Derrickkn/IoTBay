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
import java.sql.PreparedStatement;
import java.util.List;

public class UserDao {

    public static void deleteRegisteredUser(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private Statement statement;
    
    public UserDao(Connection conn) throws ClassNotFoundException, SQLException {
        statement = conn.createStatement();
    }
    
    //Adds a user to the users database.
    //Written by: Derrick
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
    
    //Written by: Derrick
    //Adds unregistered user to the database
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
    
    //Written by: Kira
    //Adds staff member to a database
     public void addStaff(String email, String firstName, String lastName, String password, String mobile, String EContact) throws SQLException {
        
        ResultSet result = statement.executeQuery("SELECT max(USERID) from staff_table");
        int userID = 0;
        while (result.next()) {
            userID = result.getInt(1) + 1;
        }
        
        //Query for adding a new row in the staff users table.
        String staffQuery = "INSERT INTO staff_Table (UserID, Password, EContact, StaffType)";
        staffQuery += "VALUES (" + userID + ", '" + password + "', '" + EContact + "', 'S')";
        statement.executeUpdate(staffQuery);
        
        //Query for adding a new row in the registered users table.
        String unregisteredQuery = "INSERT INTO UnregisteredUser_Table (UserID, FName, LName, Email, Phone, UserType)";
        unregisteredQuery += "VALUES (" + userID + ", '" + firstName + "', '" + lastName + "', '" + email + "', '" + mobile + "', 'S')";
        statement.executeUpdate(unregisteredQuery);
    }
     
    //Written by: Derrick
    //Deletes a registered user by their userid.
    public void deleteRegisteredUser(int userID) throws SQLException {
        String query = "DELETE FROM registeredUser_Table where userid = " + userID;
        statement.executeUpdate(query);
    }
    
    //Written by: Kira
    //Deletes a registered user by their userid.
    public void deleteStaff(int staffID) throws SQLException {
        String query = "DELETE FROM staff_Table where userid = " + staffID;
        statement.executeUpdate(query);
    }
    
    //Written by: Derrick
    //Checks whether a user exists in the database given their email address.
    public boolean userExists(String email) throws SQLException {
        String query = "select * from unregistereduser_table natural join registereduser_table where upper(email) = " + "upper('" + email+ "')";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            return result.getString(4).toUpperCase().equals(email.toUpperCase());
        }
        return false;
    }
    
    //Written by: Kira
    //Checks whether a user exists in the database given their userID.
    public boolean userIDExists(int userid) throws SQLException {
        String query = "select * from unregistereduser_table natural join registereduser_table where userid = " + userid;
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            return result.getInt(1) == userid;
        }
        return false;
    }
    
    
    //Gets a User from the users database only if both email and password is correct. Returns a user(registereduser) as a bean.
    //Written by: Derrick
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
    
    //selects user based on their user is from the database
    //Written by: Kira
    public registeredUser selectUserById(int userid) throws SQLException {
        String query = "select * from unregistereduser_table natural join registereduser_table where userid = " + userid;
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            if (result.getInt(1) == userid) {
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
      
    //Gets a Staff from the staff database only if both email and password is correct. Returns a staff(staff) as a bean.
    //Written by: Kira
    public staff getStaff(String email, String password) throws SQLException {
        String query = "select * from staff_table natural join unregistereduser_table where upper(email) = " + "upper('" + email+ "')";
        ResultSet result = statement.executeQuery(query);
        while (result.next()) {
            if (result.getString(4).toUpperCase().equals(email.toUpperCase()) && result.getString(7).equals(password)) {
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
                return staff;
            }
        }
        return null;
    }
     
    
    //Creates an access log given a users id.
    //Written by: Derrick
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
    
    //Written by: Derrick
    public void accessLogEnd(int accessLogID) throws SQLException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String query = "UPDATE AccessLog_Table Set LoginEnd = '" + timestamp + "' WHERE AccessLogID = " + accessLogID + "";
        statement.executeUpdate(query);
    }
    
    //Written by: Derrick
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
    
    //Written by: Derrick
    public void updateAll(int userID, String firstName, String lastName, String email, String password, String mobile, String address, String paymentDetail, String paymentMethod) throws SQLException {
        String query1 = "UPDATE ISDUSER.UNREGISTEREDUSER_TABLE SET FNAME = '" + firstName + "', LNAME = '" + lastName + "', EMAIL = '" + email + "', Phone = '" + mobile + "' WHERE USERID = " + userID;
        String query2 = "UPDATE ISDUSER.REGISTEREDUSER_TABLE SET PASSWORD = '" + password + "', PAYMENTMETHOD = '" + paymentMethod + "', PAYMENT = '" + paymentDetail + "', SAVEDADDRESS = '" + address + "' WHERE USERID =" + userID;
        statement.executeUpdate(query1);
        statement.executeUpdate(query2);
    }
    
    //Written by: Kira
     public void updateAllStaff(int userID, String firstName, String lastName, String email, String mobile, String password, String EContact, String staffType) throws SQLException {
        String query1 = "UPDATE ISDUSER.UNREGISTEREDUSER_TABLE SET FNAME = '" + firstName + "', LNAME = '" + lastName + "', EMAIL = '" + email + "', Phone = '" + mobile + "' WHERE USERID = " + userID;
        String query2 = "UPDATE ISDUSER.STAFF_TABLE SET PASSWORD = '" + password + "', ECONTACT = '" + EContact + "', STAFFTYPE = '" + staffType + "' WHERE USERID =" + userID;
        statement.executeUpdate(query1);
        statement.executeUpdate(query2);
    }
    
    //Written by: Derrick
    //Deactivates user account
    public void deactivateAccount(int userID) throws SQLException {
        String query = "UPDATE ISDUSER.REGISTEREDUSER_TABLE SET ACTIVATED =  FALSE WHERE USERID = " + userID;
        statement.executeUpdate(query);
    }
    
    //Written by: Derrick
    //Gets all users and returns them as an arraylist.
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
    
    //Gets all staff members and returns them as an arraylist
    //Written by: Kira
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
