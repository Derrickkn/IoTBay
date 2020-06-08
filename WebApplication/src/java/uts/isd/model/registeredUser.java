/*
* Customer Javabean
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author group 57 isd
 */
public class registeredUser extends unregisteredUser implements Serializable {

    private String password;
    private String paymentMethod;
    private String paymentDetail;
    private String savedAddress;
    private boolean activated;
    private int loyaltyPoints;

    public registeredUser(int UserID, String password, String firstName, String lastName, String email, String mobile, String userType) {
        super(UserID, firstName, lastName, email, mobile, userType);
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentDetail() {
        return paymentDetail;
    }

    public void setPaymentDetail(String paymentDetail) {
        this.paymentDetail = paymentDetail;
    }

    public String getSavedAddress() {
        return savedAddress;
    }

    public void setSavedAddress(String savedAddress) {
        this.savedAddress = savedAddress;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public int getLoyaltyPoints() {
        return loyaltyPoints;
    }

    public void setLoyaltyPoints(int loyaltyPoints) {
        this.loyaltyPoints = loyaltyPoints;
    }
    
    
}
