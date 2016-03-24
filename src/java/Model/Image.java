/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author HP EliteBook
 */
public class Image {
    public static ArrayList<Image> listImg = new ArrayList<Image>();
    
    private int IDImage;
    private String linkImage;
    private String type;
    private String name;
    private int author;
    private int album;
    private int like;
    private int accept;
    private double rate;
    private int view;
    private int price;
    
    /**
     * @return the listImg
     */
    public static ArrayList<Image> getListImg() {
        return listImg;
    }

    /**
     * @param aListImg the listImg to set
     */
    public static void setListImg(ArrayList<Image> aListImg) {
        listImg = aListImg;
    }
    
    public static int LengthListImg(){
        return getListImg().size();
    }
    
    public static Image getImage(int id){
        return getListImg().get(id);
    }
    
    public void addInfo(int id, String link, String type, String name, int author, int album, int like,
                        int accept, double rate, int view){
        setIDImage(id);
        setLinkImage(link);
        this.setType(type);
        this.setName(name);
        this.setAuthor(author);
        this.setLike(like);
        this.setRate(rate);
        this.setAccept(accept);
        this.setView(view);
    }

    /**
     * @return the IDImage
     */
    public int getIDImage() {
        return IDImage;
    }

    /**
     * @param IDImage the IDImage to set
     */
    public void setIDImage(int IDImage) {
        this.IDImage = IDImage;
    }

    /**
     * @return the linkImage
     */
    public String getLinkImage() {
        return linkImage;
    }

    /**
     * @param linkImage the linkImage to set
     */
    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the author
     */
    public int getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(int author) {
        this.author = author;
    }

    /**
     * @return the album
     */
    public int getAlbum() {
        return album;
    }

    /**
     * @param album the album to set
     */
    public void setAlbum(int album) {
        this.album = album;
    }

    /**
     * @return the like
     */
    public int getLike() {
        return like;
    }

    /**
     * @param like the like to set
     */
    public void setLike(int like) {
        this.like = like;
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

    /**
     * @return the rate
     */
    public double getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(double rate) {
        this.rate = rate;
    }

    /**
     * @return the view
     */
    public int getView() {
        return view;
    }

    /**
     * @param view the view to set
     */
    public void setView(int view) {
        this.view = view;
    }

    /**
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(int price) {
        this.price = price;
    }

    
}