/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import DataAccess.Image_DAL;
import DataAccess.Report_DAL;
import DataAccess.User_DAL;
import Model.Image;
import Model.User;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author Razer Duy
 */
public class DataFilter implements Filter {

    private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("DataFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        User_DAL.getAllUser();
        Image_DAL.getAllImage();
        Report_DAL.getAllReport();
        ArrayList<Image> images = Image.getListImg();
        ArrayList<User> users = User.getList_user();
        request.setAttribute("listAllImages", images);
        request.setAttribute("listAllUsers", users);
        chain.doFilter(request, response);
        
    }

    public void destroy() {
        //close any resources here
    }
}
