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

    public List<Device> getAllDevices() throws SQLException {
        String query = "select * from device";
        ResultSet result = statement.executeQuery(query);
        List<Device> devices = new ArrayList();
        while (result.next()) {
            devices.add(new Device(result.getInt(1), result.getString(2), result.getString(3), result.getDouble(4), result.getInt(5)));
        }
        return devices;
    }

    public List<Device> searchDevices(String id, String name) throws SQLException {
        String query = "select * from device where id >0";
        if(id != null && !id.isEmpty()) {
            query  = query + " and id=" + id;
        }
        if(name != null && !name.isEmpty()) {
            query  = query + " and name like '%" + name + "%'";
        }
        System.out.println("======="+query);
        ResultSet result = statement.executeQuery(query);
        List<Device> devices = new ArrayList();
        while (result.next()) {
            devices.add(new Device(result.getInt(1), result.getString(2), result.getString(3), result.getDouble(4), result.getInt(5)));
        }
        return devices;
    }

    public void addDevice(String name, String type, String price, String quantity) throws SQLException {
        String query = "INSERT INTO DEVICE (\"NAME\", \"TYPE\", \"PRICE\", \"QUANTITY\") VALUES  ('" + name + "', '" + type + "', " + price + ", " + quantity + ")";
        statement.executeUpdate(query);
    }

    public void updateDevice(String id, String name, String type, String price, String quantity) throws SQLException {
        String query = "UPDATE DEVICE SET NAME='" + name + "', TYPE='" + type + "', PRICE=" + price + ", QUANTITY=" + quantity + " WHERE ID=" + id;
        statement.executeUpdate(query);
    }

    public void deleteDevice(String id) throws SQLException {
        String query = "delete from DEVICE where ID=" + id;
        statement.executeUpdate(query);
    }

}
