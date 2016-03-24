/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Razer Duy
 */
public class Cart {
    private int id;
    private int id_user;
    private int id_img;
    private int id_author;
    private int codeATM;
    private int paid;

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
     * @return the id_author
     */
    public int getId_author() {
        return id_author;
    }

    /**
     * @param id_author the id_author to set
     */
    public void setId_author(int id_author) {
        this.id_author = id_author;
    }

    /**
     * @return the codeATM
     */
    public int getCodeATM() {
        return codeATM;
    }

    /**
     * @param codeATM the codeATM to set
     */
    public void setCodeATM(int codeATM) {
        this.codeATM = codeATM;
    }

    /**
     * @return the paid
     */
    public int getPaid() {
        return paid;
    }

    /**
     * @param paid the paid to set
     */
    public void setPaid(int paid) {
        this.paid = paid;
    }
}
