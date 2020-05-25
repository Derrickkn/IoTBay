/*
* Customer Javabean
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author Kira
 */
public class registeredUser extends unregisteredUser implements Serializable {

    private String password;
    private String paymentMethod;
    private String paymentDetail;
    private String savedAddress;
    private boolean activated;

    public registeredUser(String fname, String lname, String email, int mobile, String password, String paymentMethod, String paymentDetail, String savedAddress, boolean activated) {
        super(fname, lname, email, mobile, 'R');       
        this.password = password;
        this.paymentMethod = paymentMethod;
        this.paymentDetail = paymentDetail;
        this.savedAddress = savedAddress;
        this.activated = activated;
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
}
