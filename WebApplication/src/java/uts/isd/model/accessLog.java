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
public class accessLog implements Serializable {

    private int accessLogID;
    private int userID;
    private String loginStart;
    private String logoutEnd;

    public accessLog(int accessLogID, int userID, String loginStart, String logoutEnd) {
        this.accessLogID = accessLogID;
        this.userID = userID;
        this.loginStart = loginStart;
        this.logoutEnd = logoutEnd;
    }

    public int getAccessLogID() {
        return accessLogID;
    }

    public void setAccessLogID(int accessLogID) {
        this.accessLogID = accessLogID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getLoginStart() {
        return loginStart;
    }

    public void setLoginStart(String loginStart) {
        this.loginStart = loginStart;
    }

    public String getLogoutEnd() {
        return logoutEnd;
    }

    public void setLogoutEnd(String logoutEnd) {
        this.logoutEnd = logoutEnd;
    }

}
