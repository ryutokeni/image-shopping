/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DataAccess.Image_DAL;
import Model.Image;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Ryuto
 */

public class Upload extends HttpServlet {
    
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
            out.println("<title>Servlet Upload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Upload at " + request.getContextPath() + "</h1>");
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
        int k = 0;
        String userid = null;
        ArrayList<String> nameImage = new ArrayList<String>();
        String album = null;
        ArrayList<String> typeImage = new ArrayList<String>();
        ArrayList<Integer> priceImage = new ArrayList<Integer>();
        
        String tempPath = "/temp";
        String absoluteTempPath = this.getServletContext().getRealPath(tempPath);
        if (absoluteTempPath == null){
            String serverContext = this.getServletContext().getRealPath("/");
            String createPath = serverContext + "temp";
            File tempfolder = new File(createPath);
            tempfolder.mkdir();
            absoluteTempPath = this.getServletContext().getRealPath(tempPath);
        }
        String absoluteFilePath = this.getServletContext().getRealPath("/data/Image");
        int maxFileSize = 50 * 1024;
        int maxMemSize = 4 * 1024;
        
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            File file = new File(absoluteTempPath);
             
            factory.setRepository(file);
            ServletFileUpload upload = new ServletFileUpload(factory);

            //upload.setProgressListener(new MyProgressListener(out));
            List<FileItem> items = upload.parseRequest(request);
            
            if (items.size() > 0) {
                for (int i = items.size() - 1; i >= 0; i--) {
                    if (items.get(i).isFormField()) {
                        if (null != items.get(i).getFieldName()) switch (items.get(i).getFieldName()) {
                            case "userid":
                                userid = items.get(i).getString();
                                break;
                            case "nameImageUpload":
                                nameImage.add(items.get(i).getString());
                                break;
                            case "albumUpload":
                                album = items.get(i).getString();
                                break;
                            case "typeImageUpload":
                                typeImage.add(items.get(i).getString());
                                break;
                            case "priceImageUpload":
                                priceImage.add(parseInt(items.get(i).getString()));
                                break;
                            default:
                                break;
                        }
                    } else if ("images".equals(items.get(i).getFieldName())) {
                        if (!"".equals(items.get(i).getName()) && !items.get(i).getName().isEmpty()) {
                            String extension = null;
                            String newLink;
                            Integer newIntIdImage = Image.listImg.size()+ k;
                            String newIdImage = newIntIdImage.toString();
                            if (items.get(i).getName().endsWith("jpg")) {
                                newLink = "/Image/" + newIdImage + ".jpg";
                                file = new File(absoluteFilePath + "//" + newIdImage + ".jpg");
                            } else if(items.get(i).getName().endsWith("JPG")){
                                newLink = "/Image/" + newIdImage + ".jpg";
                                file = new File(absoluteFilePath + "//" + newIdImage + ".jpg");
                            } else if (items.get(i).getName().endsWith("png")) {
                                newLink = "/Image/" + newIdImage + ".png";
                                file = new File(absoluteFilePath + "//" + newIdImage + ".png");
                            } else if(items.get(i).getName().endsWith("PNG")){
                                newLink = "/Image/" + newIdImage + ".png";
                                file = new File(absoluteFilePath + "//" + newIdImage + ".png");
                            } else{
                                return;
                            }
                            boolean check = Image_DAL.addImage(newLink, userid, album, nameImage.get(0), typeImage.get(0), priceImage.get(0));
                            nameImage.remove(0);
                            typeImage.remove(0);
                            priceImage.remove(0);
                            if (check) {
                                items.get(i).write(file);
                                k++;
                            }
                        }
                    } else {
                    }
                }
                request.setAttribute("user", userid);
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index");
                dispatcher.forward(request, response);
                return;
            }
            for (int i = items.size() - 1; i >= 0; i--)
                    if (items.get(i).isFormField())
                        if ("userid".equals(items.get(i).getFieldName()))
                            userid = items.get(i).getString();

            request.setAttribute("error", "No file upload");
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index");
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            System.err.println(ex);
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