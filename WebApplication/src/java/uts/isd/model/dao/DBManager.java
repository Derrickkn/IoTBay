package uts.isd.model.dao;
import uts.isd.model.registeredUser;
import java.sql.*;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {

    private Statement st;
   
    public DBManager(Connection conn) throws SQLException {       
        st = conn.createStatement();   
    }

    //Login Function
    public registeredUser Login(String email, String password) throws SQLException {       

        String query = "select * from unregistereduser_table natural join registereduser_table where upper(email) = " + "upper('" + email + "')";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            if (rs.getString(7).equals(password)) {
                int userID = rs.getInt(1);
                String fName = rs.getString(2);
                String lName = rs.getString(3);
                String userEmail = rs.getString(4);
                String mobile = rs.getString(5);
                String userType = rs.getString(6);
                String userPassword = rs.getString(7);
                return new registeredUser(userID, userPassword, fName, lName, userEmail, mobile, userType);
            }
        }
        System.out.println("Email not found or password incorrect.");
        return null;   
    }

    //Add a user-data into the database   
    public void addUser(String email, String name, String password, String gender, String favcol) throws SQLException {                   //code for add-operation       
        st.executeUpdate("sql query");   
    }

    //update a user details in the database   
    public void updateUser( String email, String name, String password, String gender, String favcol) throws SQLException {       
        //code for update-operation   
    }       

    //delete a user from the database   
    public void deleteUser(String email) throws SQLException{       
        //code for delete-operation   
    }
}