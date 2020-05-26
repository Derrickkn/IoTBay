/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author bappa
 */
public class order implements Serializable {

    private int orderID;
    private int userID;
    private String orderDate;
    private int trackingNo;
    private boolean orderPaid;
    private String shipmentAddress;
    private String orderStatus;
    private float totalCost;
    private String paymentMethod;
    private int cardNo;

    public order(int orderID, int userID, String orderDate, int trackingNo, boolean orderPaid, String shipmentAddress, String orderStatus, float totalCost, String paymentMethod, int cardNo) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.trackingNo = trackingNo;
        this.orderPaid = orderPaid;
        this.shipmentAddress = shipmentAddress;
        this.orderStatus = orderStatus;
        this.totalCost = totalCost;
        this.paymentMethod = paymentMethod;
        this.cardNo = cardNo;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getTrackingNo() {
        return trackingNo;
    }

    public void setTrackingNo(int trackingNo) {
        this.trackingNo = trackingNo;
    }

    public boolean isOrderPaid() {
        return orderPaid;
    }

    public void setOrderPaid(boolean orderPaid) {
        this.orderPaid = orderPaid;
    }

    public String getShipmentAddress() {
        return shipmentAddress;
    }

    public void setShipmentAddress(String shipmentAddress) {
        this.shipmentAddress = shipmentAddress;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public float getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(float totalCost) {
        this.totalCost = totalCost;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getCardNo() {
        return cardNo;
    }

    public void setCardNo(int cardNo) {
        this.cardNo = cardNo;
    }
 
}
