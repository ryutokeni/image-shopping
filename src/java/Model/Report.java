/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Razer Duy
 */
public class Report {
    private static ArrayList<Report> listReport = new ArrayList<Report>();

    
    
    private int id;
    private int id_user;
    private int id_img;
    private String content;
    private int accept;
/**
     * @return the listReport
     */
    public static ArrayList<Report> getListReport() {
        return listReport;
    }

    /**
     * @param aListReport the listReport to set
     */
    public static void setListReport(ArrayList<Report> aListReport) {
        listReport = aListReport;
    }
    

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the id_user
     */
    public int getId_user() {
        return id_user;
    }

    /**
     * @param id_user the id_user to set
     */
    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    /**
     * @return the id_img
     */
    public int getId_img() {
        return id_img;
    }

    /**
     * @param id_img the id_img to set
     */
    public void setId_img(int id_img) {
        this.id_img = id_img;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the accept
     */
    public int getAccept() {
        return accept;
    }

    /**
     * @param accept the accept to set
     */
    public void setAccept(int accept) {
        this.accept = accept;
    }

   
}
