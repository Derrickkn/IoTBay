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
import java.util.ArrayList;
import java.util.List;
import uts.isd.model.Device;
import uts.isd.model.registeredUser;

public class DeviceDao {
    
    private Statement statement;
    
    public DeviceDao(Connection conn) throws ClassNotFoundException, SQLException {
        statement = conn.createStatement();
    }
    
    //Gets a User from the users database only if both email and password is correct. Returns a user(registereduser) as a bean.
    public List<Device> getAllDevices() throws SQLException {
        String query = "select * from device";
        ResultSet result = statement.executeQuery(query);
        List<Device> devices = new ArrayList();
        while (result.next()) {
            devices.add(new Device(result.getInt(1), result.getString(2), result.getString(3),result.getDouble(4),result.getInt(5)));
        }
        return devices;
    }

}
