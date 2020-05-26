/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author bappa
 */
import java.io.Serializable;

public class product implements Serializable {

    private int productID;
    private String name;
    private float price;
    private String description;
    private int amountOnHand;
    private String suppliedDate;

//arg constructor
    public product(int productID, String name, float price, String description, int amountOnHand, String suppliedDate) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.description = description;
        this.amountOnHand = amountOnHand;
        this.suppliedDate = suppliedDate;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmountOnHand() {
        return amountOnHand;
    }

    public void setAmountOnHand(int amountOnHand) {
        this.amountOnHand = amountOnHand;
    }

    public String getSuppliedDate() {
        return suppliedDate;
    }

    public void setSuppliedDate(String suppliedDate) {
        this.suppliedDate = suppliedDate;
    }

}
