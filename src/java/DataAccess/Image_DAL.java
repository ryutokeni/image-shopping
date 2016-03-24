/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Model.Album;
import Model.Image;
import Model.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Razer Duy
 */
public class Image_DAL extends DAL {

    public static boolean addImage(String Link, String userid, String album, String nameImage, String type, int price) throws SQLException, ClassNotFoundException {
        int verify = 0;
        int IDalbum = -1;
        Connection con = Image_DAL.Connecting();
        ArrayList<Album> listAlbum = Album_DAL.Search("", userid, album);
        if (listAlbum != null && listAlbum.size() != 0) {
            IDalbum = listAlbum.get(0).getId();
        } else {
            CallableStatement csc = con.prepareCall("{call count_album()}");
            csc.execute();
            ResultSet rs = csc.getResultSet();
            if (rs.next()) {
                IDalbum = rs.getInt(1);
            }
            CallableStatement cs = con.prepareCall("{call add_album(?, ?)}");
            cs.setInt(1, Integer.parseInt(userid));
            cs.setString(2, album);
            cs.execute();
        }
        CallableStatement cs = con.prepareCall("{call add_image(?, ?, ?, ?, ?, ?)}");
        cs.setString(1, type);
        cs.setString(2, nameImage);
        cs.setInt(3, Integer.parseInt(userid));
        cs.setString(4, Link);
        cs.setInt(5, price);
        cs.setInt(6, IDalbum);
        boolean check = !cs.execute();
        con.close();
        return check;
    }

    public static int getListImageSize() {
        try {
            Connection con = DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call count_image()}");
            cs.execute();
            ResultSet rs = cs.getResultSet();
            con.close();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Image_DAL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static void getAllImage() {
        ArrayList<Image> list = new ArrayList<Image>();
        try {
            Connection con = DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call get_images()}");
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                Image img = new Image();
                img.setIDImage(rs.getInt("id"));
                img.setType(rs.getString("type"));
                img.setName(rs.getString("name"));
                img.setAuthor(rs.getInt("author"));
                img.setLike(rs.getInt("likes"));
                img.setLinkImage("./data" + rs.getString("link"));
                img.setPrice(rs.getInt("price"));
                img.setView(rs.getInt("views"));
                img.setRate(rs.getInt("rate"));
                img.setAlbum(rs.getInt("id_album"));
                img.setAccept(rs.getInt("accept"));
                list.add(img);
            }
            Image.setListImg(list);
            con.close();
        } catch (Exception e) {

        }
    }

    public static ArrayList<Image> getPaidImage(String userid) {
        ArrayList<Image> images = new ArrayList<Image>();
        try {
            Connection con = DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call get_paid_image(?)}");
            cs.setInt(1, Integer.parseInt(userid));
            cs.execute();
            ResultSet rs = cs.getResultSet();
            
            while (rs.next()) {
                images.add(Image.listImg.get(rs.getInt(1)));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Image_DAL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return images;
    }

    public static ArrayList<Image> Search(String nameImage, String type, String author, String name_album) {
        try {
            Connection con = DAL.Connecting();
            String SQL = "SELECT * FROM image_shopping.image WHERE (1=1)";
            if (!nameImage.isEmpty()) {
                SQL = SQL + "AND name = '" + nameImage + "'";
            }
            if (!type.isEmpty()) {
                SQL = SQL + "AND type = '" + type + "'";
            }
            if (!author.isEmpty()) {
                SQL = SQL + "AND author = '" + author + "'";
            }
            if (!name_album.isEmpty()) {
                SQL = SQL + "AND id_album = (select album.id from image_shopping.album where image_shopping.album.name = '" + name_album + "')";
            }
            SQL = SQL + ";";
            ResultSet rs;
            try {
                ArrayList<Image> images = new ArrayList<Image>();
                ArrayList<User> list_user = User.getList_user();
                rs = DAL.ExecuteQuery(SQL, con);
                while (rs.next()) {
                    Image img = new Image();

                    img.setIDImage(rs.getInt("id"));
                    img.setType(rs.getString("type"));
                    img.setName(rs.getString("name"));
                    img.setAuthor(rs.getInt("author"));
                    img.setLike(rs.getInt("likes"));
                    img.setLinkImage("./data" + rs.getString("link"));
                    img.setPrice(rs.getInt("price"));
                    img.setView(rs.getInt("views"));
                    img.setRate(rs.getInt("rate"));
                    img.setAlbum(rs.getInt("id_album"));
                    img.setAccept(rs.getInt("accept"));

                    images.add(img);

                }
                con.close();
                return images;
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DAL.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static ArrayList<Integer> top10Download() {
        ArrayList<Integer> list = new ArrayList<>();
        try {
            Connection con = DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call image_sell_max()}");
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                list.add(rs.getInt("id_image"));
            }
            con.close();
            return list;
        } catch (Exception e) {
            return null;
        }
    }

    public static boolean UpdatePermission(int IDimg, int permission) {
        try {
            Connection con = Report_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call permission_img(?, ?)}");
            cs.setInt(1, IDimg);
            cs.setInt(2, permission);
            cs.execute();
            con.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void AddView(int IDimg) {
        try {
            Connection con = Report_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call view_img(?)}");
            cs.setInt(1, IDimg);
            cs.execute();
            con.close();
        } catch (Exception e) {
        }
    }

}