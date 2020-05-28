/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author group 57 isd
 */
public class staff extends unregisteredUser implements Serializable {

    private String password;
    private String emergencyContact;
    private String staffType;

    public staff(String password, String staffType, int UserID, String firstName, String lastName, String email, String mobile, String userType) {
        super(UserID, firstName, lastName, email, mobile, userType);
        this.password = password;
        this.staffType = staffType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public String getStaffType() {
        return staffType;
    }

    public void setStaffType(String staffType) {
        this.staffType = staffType;
    }
    
    
}
