/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Image;
import DataAccess.Image_DAL;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
 * @author HP EliteBook
 */
@WebServlet(name = "LoadImage", urlPatterns = {"/LoadImage"})
public class LoadImage extends HttpServlet {

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
            out.println("<title>Servlet LoadImage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadImage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private Boolean isImageFile(Path filePath) {
        String[] supportedExtensions = {".jpg", ".png", ".JPG", ".PNG"};

        for (String extension : supportedExtensions) {
            if (filePath.toString().endsWith(extension)) {
                return true;
            }
        }

        return false;
    }

    private List<Image> loadImages(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        // this code only runs with java 8
        String nameImage = request.getParameter("nameImage");
        String typeImage = request.getParameter("typeImage");
        String authorImage = request.getParameter("authorImage");
        List<Image> images = Image_DAL.Search(nameImage, typeImage, authorImage, "");
        return images;
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
        try {
            List<Image> images = loadImages(request, response);
            request.setAttribute("images", images);
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(LoadImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/LoadImage.jsp");
        dispatcher.forward(request, response);
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
        String tempPath = "/temp";
        String absoluteTempPath = this.getServletContext().getRealPath(tempPath);
        String absoluteFilePath = this.getServletContext().getRealPath("/data/Image");
        int maxFileSize = 50 * 1024;
        int maxMemSize = 4 * 1024;

        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            File file = new File(absoluteTempPath);

            if (file == null) {
                // tao thu muc
            }

            factory.setRepository(file);
            ServletFileUpload upload = new ServletFileUpload(factory);

            //upload.setProgressListener(new MyProgressListener(out));
            List<FileItem> items = upload.parseRequest(request);

            if (items.size() > 0) {
                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        if ("images".equals(item.getFieldName())) {
                            if (item.getName() != null && !item.getName().isEmpty()) {
                                String extension = null;
                                if (item.getName().endsWith("jpg")) {
                                    String newLink = "/Image/" + Image.LengthListImg() + ".jpg";
                                    file = new File(absoluteFilePath + "//" + Image.LengthListImg() + ".jpg");
                                    // Gọi hàm add hình vào database, link hình là newLink
                                    item.write(file);
                                } else if (item.getName().endsWith("png")) {
                                    String newLink = "/Image/" + Image.LengthListImg() + ".png";
                                    file = new File(absoluteFilePath + "//" + Image.LengthListImg() + ".png");
                                    // Gọi hàm add hình vào database, link hình là newLink
                                    item.write(file);
                                }else if (item.getName().endsWith("JPG")) {
                                    String newLink = "/Image/" + Image.LengthListImg() + ".JPG";
                                    file = new File(absoluteFilePath + "//" + Image.LengthListImg() + ".JPG");
                                    // Gọi hàm add hình vào database, link hình là newLink
                                    item.write(file);   
                                }else if (item.getName().endsWith("PNG")) {
                                    String newLink = "/Image/" + Image.LengthListImg() + ".PNG";
                                    file = new File(absoluteFilePath + "//" + Image.LengthListImg() + ".PNG");
                                    // Gọi hàm add hình vào database, link hình là newLink
                                    item.write(file);
                                }
                            }
                        }
                    } else {
                    }
                }
                response.sendRedirect(request.getContextPath() + "/LoadImage.jsp");
                return;
            }

            List<Image> images = loadImages(request, response);
            
            request.setAttribute("images", images);
            request.setAttribute("error", "No file upload");
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/LoadImage.jsp");
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
