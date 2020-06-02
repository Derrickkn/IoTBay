package uts.isd.model.dao;


import uts.isd.model.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        String sql = "UPDATE ORDER_TABLE SET ORDERSTATUS='Cancelled' WHERE ORDERID=? ";
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
                    0,null,0
            );
            tmp.setOrderStatus(rs.getString("ORDERSTATUS"));
            res.add(tmp);
        }
        return res;
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

   public static void main(String[] args) throws SQLException, ClassNotFoundException {
        OrderDao orderDao = new OrderDao();
        //orderDao.cancelOrderByOrderId(401);
        //orderDao.cancelOrderByUserId(142);
//        List<order> res = orderDao.selectOrdersByUserid(142);
//        for( order o : res){
//            System.out.println(o.getOrderStatus());
//        }
        //orderDao.isorderowner(141,404);
        System.out.println(orderDao.orderexist(402));
    }
    
    
}


