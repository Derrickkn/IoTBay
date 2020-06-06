/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.Device;
import uts.isd.model.dao.DeviceDao;

/**
 *
 * @author krystianhuang
 */
public class EditDeviceServlet extends BaseServlet {

    DeviceDao deviceDao;

    public EditDeviceServlet() throws ClassNotFoundException, SQLException {
        this.deviceDao = new DeviceDao(dbConnector.openConnection());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("deviceId");
        try {
            Device device = deviceDao.searchDevices(id, null).get(0);
            request.setAttribute("device", device);
            request.getRequestDispatcher("editDevice.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditDeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("deviceId");
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            if (validate(request, response)) {
                if (id != null && !id.equals("")) {
                    deviceDao.updateDevice(id, name, type, price, stock);
                } else {
                    deviceDao.addDevice(name, type, price, stock);
                }
                response.sendRedirect("IoTDevices");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditDeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean validate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("deviceId");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String errorMsg = "";
        boolean isValid = true;
        if (isEmpty(type) || isEmpty(name) || isEmpty(price) || isEmpty(stock)) {
            errorMsg = "All the fields cannot be empty.";
            isValid = false;
        }
        
        if (name.length() > 100) {
            errorMsg = "The length of name should be short than 100.";
            isValid = false;
        }


        if (!isValid) {
            if (!isEmpty(id)) {
                request.getSession().setAttribute("DeviceEditError", errorMsg);
                response.sendRedirect("EditDevice?deviceId=" + id);
            } else {
                request.getSession().setAttribute("DeviceCreateError", errorMsg);
                response.sendRedirect("createDevice.jsp");
            }
        } else {
            request.getSession().setAttribute("DeviceEditError", null);
            request.getSession().setAttribute("DeviceCreateError", null);
        }
        return isValid;
    }

    public boolean isEmpty(String s) {
        return s == null || s.isEmpty();
    }
}
