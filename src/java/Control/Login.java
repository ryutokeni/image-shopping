/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DataAccess.User_DAL;
import Model.User;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;

import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP EliteBook
 */
public class Login extends HttpServlet {

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (request.getParameter("command") != null) {
            String command = request.getParameter("command");
            String url = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + request.getContextPath();

            if ("logout".equals(command)) {
                session = request.getSession();
                session.invalidate();
                response.sendRedirect(url);
            }
        } else if (user.getActive() == 1) {
            RequestDispatcher view = request.getRequestDispatcher("/views/ChangePassword.jsp");
            view.forward(request, response);
        } else if (user.getActive() == 2) {
            String url = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + request.getContextPath();
            response.sendRedirect(url);
        } else if (user.getActive() == 3) {
            String url = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + request.getContextPath();
            response.sendRedirect(url + "/Admin");
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            switch (User_DAL.checkLogin(username, password)) {
                case 3:
                case 2: {
                    // Go back
                    User us = User.getUserbyUsername(username);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", us);
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    JsonObject myObj = new JsonObject();
                    myObj.addProperty("success", true);
                    out.println(myObj.toString());
                    out.close();
                    break;
                }
                case 1: {
                    // Go to page change password
                    User us = User.getUserbyUsername(username);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", us);
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    JsonObject myObj = new JsonObject();
                    myObj.addProperty("success", true);
                    out.println(myObj.toString());
                    out.close();
                    break;
                }
                default:
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");            
                    JsonObject myObj = new JsonObject();
                    myObj.addProperty("success", false);
                    out.println(myObj.toString());
                    out.close();
                    break;
            }
        } catch (Exception e) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, e);
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

}
