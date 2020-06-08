/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.Device;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DeviceDao;

/**
 *
 * @author krystianhuang
 */
public class BaseServlet extends HttpServlet {
    DBConnector dbConnector;

    public BaseServlet() throws ClassNotFoundException, SQLException {
        dbConnector = new DBConnector();
    }

    public DBConnector getDbConnector() {
        return dbConnector;
    }

    public void setDbConnector(DBConnector dbConnector) {
        this.dbConnector = dbConnector;
    }

}
