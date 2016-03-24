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
public class Like {
    private int id_user;
    private int id_img;

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
}
