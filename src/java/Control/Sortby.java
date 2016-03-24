/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Image;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Razer Duy
 */
public class Sortby extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sortby</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sortby at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //String typeSort = request.getParameter("by");
        String type = request.getParameter("by");
        request.setAttribute("sortby", type);
        ArrayList<Image> listAllImg = (ArrayList<Image>) request.getAttribute("listAllImages");
        
        if (null != type) {
            switch (type) {
                case "view":
                    for(int i = 0; i < listAllImg.size() - 1; i++)
                        for(int j = i + 1; j < listAllImg.size(); j++)
                            if(listAllImg.get(i).getView() < listAllImg.get(j).getView())
                                Collections.swap(listAllImg, i, j);
                    request.setAttribute("listAllImages", listAllImg);
                    break;
                case "rate":
                    for(int i = 0; i < listAllImg.size() - 1; i++)
                        for(int j = i + 1; j < listAllImg.size(); j++)
                            if(listAllImg.get(i).getRate() < listAllImg.get(j).getRate())
                                Collections.swap(listAllImg, i, j);
                    request.setAttribute("listAllImages", listAllImg);
                    break;
                default:
                    for(int i = 0; i < listAllImg.size() - 1; i++)
                        for(int j = i + 1; j < listAllImg.size(); j++)
                            if(listAllImg.get(i).getIDImage() > listAllImg.get(j).getIDImage())
                                Collections.swap(listAllImg, i, j);
                    request.setAttribute("listAllImages", listAllImg);
                    break;
            }
        }
        RequestDispatcher view = request.getRequestDispatcher("/views/index.jsp");
        view.forward(request, response);
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
