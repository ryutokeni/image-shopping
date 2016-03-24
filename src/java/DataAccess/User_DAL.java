/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Model.Image;
import Model.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Razer Duy
 */
public class User_DAL extends DAL {

    public static boolean Register_User(String username, String password, String fullname, String email, String phone, String address) {

        try {
            Connection con = Connecting();
            CallableStatement cs = con.prepareCall("call add_user(?,?,?,?,?,?)");
            cs.setString(1, username);
            cs.setString(2, password);
            cs.setString(3, fullname);
            cs.setString(4, email);
            cs.setString(5, phone);
            cs.setString(6, address);
            cs.execute();
            con.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean ChangPassword(int id, int code, String pass) {
        try {
            Connection con = Connecting();
            CallableStatement cs = con.prepareCall("call active_pass_user(?,?,?)");
            cs.setInt(1, id);
            cs.setInt(2, code);
            cs.setString(3, pass);
            cs.execute();
            con.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static int checkLogin(String username, String password) {
        try {
            // Procedure Check username and password
            Connection con = User_DAL.Connecting();
            String SQL = "SELECT * FROM image_shopping.user WHERE"
                    + " username = '" + username + "'"
                    + " and password = '" + password + "';";
            ResultSet rs = DAL.ExecuteQuery(SQL, con);
            rs.next();
            int active = rs.getInt(8);
            con.close();
            return active;
        } catch (Exception e) {
            return 0;
        }
    }

    public static void getAllUser() {
        ArrayList<User> list = new ArrayList<User>();
        try {
            Connection con = User_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call get_user()}");
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                User us = new User();
                us.setID(rs.getInt("id"));
                us.setUsername(rs.getString("username"));
                //us.setPassword(rs.getString("password"));
                us.setFullname(rs.getString("fullname"));
                us.setEmail(rs.getString("email"));
                us.setPhone(rs.getString("phone"));
                us.setAddress(rs.getString("address"));
                us.setActive(rs.getInt("active"));
                list.add(us);
            }
            User.setList_user(list);
            con.close();
        } catch (Exception e) {

        }
    }

    public static ArrayList<Integer> top10Seller() {
        ArrayList<Integer> list = new ArrayList<>();
        try {
            Connection con = DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call author_sell_max()}");
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                list.add(rs.getInt("id_author"));
            }
            con.close();
            return list;
        } catch (Exception e) {
            return null;
        }
    }

    public static boolean addReport(int IDImage, int IDUser, String reason) {
        try {
            Connection con = User_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call add_report(?, ?, ?)}");
            cs.setInt(1, IDUser);
            cs.setInt(2, IDImage);
            cs.setString(3, reason);
            cs.execute();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public static boolean UpdatePermission(int IDUser, int permission){
        try{
            Connection con = User_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call permission_user(?, ?)}");
            cs.setInt(1, IDUser);
            cs.setInt(2, permission);
            cs.execute();
            return true;
        }catch(Exception e){
            return false;
        }
    }
    
    public static boolean checkLike(int IDImg, int IDUser){
        try{
            Connection con = User_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call check_like(?,?)}");
            cs.setInt(1, IDUser);
            cs.setInt(2, IDImg);
            cs.execute();
            ResultSet rs = cs.getResultSet();
            rs.next();
            boolean check = (rs.getInt(1) ==  0);
            con.close();
            return check;
        }catch(Exception e){
            return false;
        }
    }
    
    public static void Like(int IDImg, int IDUser){
        try{
            Connection con = User_DAL.Connecting();
            CallableStatement cs = null;
            if(User_DAL.checkLike(IDImg, IDUser)){
                cs = con.prepareCall("{call like_img(?,?)}");
                cs.setInt(1, IDUser);
                cs.setInt(2, IDImg);
                cs.execute();
            }else{
                cs = con.prepareCall("{call remove_like(?,?)}");
                cs.setInt(1, IDUser);
                cs.setInt(2, IDImg);
                cs.execute();
            }
            con.close();
        }catch(Exception e){
            
        }
    }
    
    
 //-----------------------------------------------C A R T-------------------------------------------------//
    
    
    /*
    Function addCart:
    Store Procedure:
    CREATE DEFINER=`root`@`localhost` PROCEDURE `add_cart`(id_user int, id_img int, id_author int)
    BEGIN
        insert into `image_shopping`.`cart` (`id_user`, `id_image`, `id_author`, `code_atm`, `paid`)
        value (id_user, id_img, id_author, null, 0);
    END
    */
    public static boolean addCart(List<Integer> listCart, int IDUser) throws SQLException{
        try (Connection con = DAL.Connecting()) {
            for (int i = 0; i < listCart.size(); i++){
                CallableStatement cs = con.prepareCall("{call add_cart(?, ?, ?)}");
                int idAuthor = -1;
                for (int j = 0; j < Image.LengthListImg(); j++){
                    if (Image.getImage(j).getIDImage() ==listCart.get(i))
                        idAuthor = Image.getImage(j).getAuthor();
                }
                cs.setInt(1, IDUser);
                cs.setInt(2, listCart.get(i));
                cs.setInt(3, idAuthor);
                cs.execute();
            }
            con.close();
        }
        return true;
    }
    /*
    Function getCart : get all the image which haven't been paid by user
    Store Procedure:
    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cart`(id_user int)
    BEGIN
        SELECT cart.id_image FROM image_shopping.cart
        WHERE cart.id_user = id_user AND cart.paid = 0;
    END
    */
    
    public static List<Image> getCart(int IDUser) throws SQLException{
        List<Image> images = new ArrayList<Image>();
        Connection con = DAL.Connecting();
        CallableStatement cs = con.prepareCall("{call get_cart(?)}");
        cs.setInt(1, IDUser);
        cs.execute();
        ResultSet rs = cs.getResultSet();
        while (rs.next()){
            int id = rs.getInt(1);
            for (int i = 0; i < Image.LengthListImg(); i++){
                if (id == Image.getImage(i).getIDImage()){
                    Image image = Image.getImage(i);
                    images.add(image);
                }
            }
        }
        con.close();
        return images;
    }

    /*
    Function removeCart: remove 1 image which haven't been paid in the Cart
    Store Procedure:
    CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_cart`(id_user int, id_image int)
    BEGIN
        DELETE FROM `image_shopping`.`cart`
        WHERE cart.id_user =  id_user
        AND cart.id_image = id_image;
    END
    */
    public static void removeCart(int IDUser, int IDImage) throws SQLException {
        Connection con = DAL.Connecting();
        CallableStatement cs = con.prepareCall("{call remove_cart(?, ?)}");
        cs.setInt(1, IDUser);
        cs.setInt(2, IDImage);
        cs.execute();
        con.close();
    }
    
    /*
    Function payCart: paying all the image in the Cart
    Store Procedure:
    CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cart`(id_user int, codeatm int)
    BEGIN
        UPDATE `image_shopping`.`cart`
        SET
        `code_atm` = codeatm,
        `paid` = 1
        WHERE `id_user` = id_user AND `paid` = 0;
    END
    */
    public static void payCart(int IDUser, int codeatm) throws SQLException{
        Connection con = DAL.Connecting();
        CallableStatement cs = con.prepareCall("{call update_cart(?, ?)}");
        cs.setInt(1, IDUser);
        cs.setInt(2, codeatm);
        cs.execute();
        con.close();
    }
    
    /*
    Function getAllCart: get all the picture in the Cart (Have been paid or not yet (paid = 0 and paid = 1))
    Store Procedure:
    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_allCart`(id_user int)
    BEGIN
        SELECT `cart`.`id_image`
        FROM `image_shopping`.`cart`;
    END
    */
    public static List<Image> getAllCart(int IDUser) throws SQLException{
        List<Image> images = new ArrayList<Image>();
        Connection con = DAL.Connecting();
        CallableStatement cs = con.prepareCall("{call get_allCart(?)}");
        cs.setInt(1, IDUser);
        cs.execute();
        ResultSet rs = cs.getResultSet();
        while (rs.next()){
            int id = rs.getInt(1);
            for (int i = 0; i < Image.LengthListImg(); i++){
                if (id == Image.getImage(i).getIDImage()){
                    Image image = Image.getImage(i);
                    images.add(image);
                }
            }
        }
        con.close();
        return images;
    }
    
}
