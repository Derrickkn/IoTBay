package uts.isd.model.dao;


import uts.isd.model.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDao {
    public static DBConnector conn;
    public OrderDao() throws ClassNotFoundException, SQLException {
        if(conn == null){
            conn = new DBConnector();
        }
    }

    /**
     * If a user cancels an order, then the order status is set to ��cancelled��
     * @param orderid: order id to be canceld
     * @return  true if cancel orders success; false if cancel failed;
     */
    public boolean cancelOrderByOrderId(int orderid) throws SQLException {
        boolean res = false;
        PreparedStatement ps;
        String sql = "UPDATE ORDER_TABLE SET ORDERSTATUS='Cancelled' WHERE ORDERID=? AND ORDERPAID = false";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,orderid);
        if(ps.executeUpdate() > 0)
            res = true;
        return res;
    }
    /**
     * If a user cancels their user account, all saved orders made by this user should be
     * @param  userid: userid whose orders will be canceled
     * @return  true if cancel orders success; false if cancel failed;
     * */
    public boolean cancelOrderByUserId(int userid) throws SQLException {
        boolean res = false;
        PreparedStatement ps;
        String sql = "UPDATE ORDER_TABLE SET ORDERSTATUS='Cancelled' WHERE USERID=? ";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,userid);
        if(ps.executeUpdate() > 0)
            res = true;
        return res;
    }

    /**
     * get all orders of user
     * */
    public List<order> selectOrdersByUserid(int userid) throws SQLException {
        List<order> res = new ArrayList<>();
        PreparedStatement ps;
        String sql = "SELECT * FROM ORDER_TABLE WHERE USERID=?";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,userid);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            order tmp = new order(
                    Integer.parseInt(rs.getString("ORDERID")),
                    userid,
                    rs.getDate("ORDERDATE").toString(),
                    rs.getBoolean("ORDERPAID"),
                    rs.getString("SHIPMENTADDRESS"),
                    (float)rs.getInt("ORDERCOST"),
                    null,
                    0
            );
            tmp.setOrderStatus(rs.getString("ORDERSTATUS"));
            tmp.setTrackingNo(rs.getInt("TRACKINGNUMBER"));
            res.add(tmp);
        }
        return res;
    }
    
    
    /**
     * get order info by userid and orderid
     * */
    public order selectOrderById(int userid,int orderid) throws SQLException{
        List<order> res1 = selectOrdersByUserid(userid);
        if(res1 == null || res1.size()==0)
            return null;
        for(order o : res1){
            if(o.getOrderID() == orderid)
                return o;
        }
        return null;
    }
    
     /**
     * order owner judgement
     */
    public boolean isorderowner(int userid,int orderid) throws SQLException{
        PreparedStatement ps;
        String sql = "SELECT * FROM ORDER_TABLE WHERE USERID=? AND ORDERID=?";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,userid);
        ps.setInt(2,orderid);
        ResultSet rs =  ps.executeQuery();
        boolean res = rs.next();
        System.out.print(res);
        return res;

    }
    
    /**
     *  judge order exist or not
     * */
    public boolean orderexist(int orderid) throws SQLException {
        PreparedStatement ps;
        String sql = "SELECT * FROM ORDER_TABLE WHERE ORDERID=?";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,orderid);
        ResultSet rs =  ps.executeQuery();
        boolean res = rs.next();
        return res;
    }
    
    /**
     * get order by userid and date
     *
     */
      public List<order> selectOrdersByDate(int userid,String date) throws SQLException {
        List<order> res = new ArrayList<>();
        PreparedStatement ps;
        String sql = "SELECT * FROM ORDER_TABLE WHERE USERID=? AND ORDERDATE = ?";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,userid);
        ps.setString(2,date);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            order tmp = new order(
                    Integer.parseInt(rs.getString("ORDERID")),
                    userid,
                    rs.getDate("ORDERDATE").toString(),
                    rs.getBoolean("ORDERPAID"),
                    rs.getString("SHIPMENTADDRESS"),
                    0,null,0
            );
            tmp.setOrderStatus(rs.getString("ORDERSTATUS"));
            res.add(tmp);
        }
        return res;
    }
      
    /**
     * create new order
     */
    public boolean createOrder(order o) throws SQLException, ParseException{
        
        String sql = "INSERT INTO ORDER_TABLE (ORDERID,USERID,ORDERDATE,TRACKINGNUMBER,ORDERPAID,SHIPMENTADDRESS,ORDERSTATUS,ORDERCOST) VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = conn.openConnection().prepareStatement(sql);
        ps.setInt(1,o.getOrderID());
        ps.setInt(2, o.getUserID());
        ps.setDate(3, getCurrentDate());
        ps.setInt(4, o.getTrackingNo());
        ps.setBoolean(5, false);
        ps.setString(6,o.getShipmentAddress());
        ps.setString(7, "Unpaid");
        ps.setInt(8,(int)o.getTotalCost());
        if(ps.executeUpdate() >0)
            return true;
        else
            return false;
    }
    public java.sql.Date getCurrentDate() throws ParseException{
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String datestr = sdf.format(date);
        return java.sql.Date.valueOf(datestr);
        
    }
    
    /**
     * update shipment address in order
     */
    public boolean updateShipmentAddress(int orderid,String address) throws SQLException{
        boolean res = false;
        PreparedStatement ps;
        String sql = "UPDATE ORDER_TABLE SET SHIPMENTADDRESS=? WHERE ORDERID=?";
        ps = conn.openConnection().prepareStatement(sql);
        ps.setString(1, address);
        ps.setInt(2,orderid);
        if(ps.executeUpdate() > 0)
            res = true;
        return res;
    }
    /**
     * get latest order id
     */
    
    public int getLastOrderId() throws SQLException{
        
        PreparedStatement ps;
        String sql = "SELECT MAX(ORDERID)AS ORDERID FROM ORDER_TABLE";
        ps = conn.openConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            
            return rs.getInt("ORDERID");
        }
        return -1;
        
    }
    /**
     * get latest track
     */
    
    public int getLastTrackingNumber() throws SQLException{
        
        PreparedStatement ps;
        String sql = "SELECT MAX(TRACKINGNUMBER)AS TRACKINGNUMBER FROM ORDER_TABLE";
        ps = conn.openConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            
            return rs.getInt("TRACKINGNUMBER");
        }
        return -1;
        
    }
    
    

   public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {
        OrderDao orderDao = new OrderDao();
        //orderDao.cancelOrderByOrderId(401);
        //orderDao.cancelOrderByUserId(142);
//        List<order> res = orderDao.selectOrdersByUserid(142);
//        for( order o : res){
//            System.out.println(o.getOrderStatus());
//        }
        //orderDao.isorderowner(141,404);
       
        order tmp = new order(1111,1111,null,false,"aaa",12,null,0);
        orderDao.createOrder(tmp);
        
    }
    
    
}


