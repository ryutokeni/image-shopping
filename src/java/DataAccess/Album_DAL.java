/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Model.Album;
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
public class Album_DAL extends DAL {

    public static String getAlbumName(String authorid, String albumid) {
        try {
            Connection con = DAL.Connecting();
            String SQL = "SELECT name FROM image_shopping.album WHERE id = " + albumid + " and id_user = " + authorid;
            ResultSet rs;
            rs = DAL.ExecuteQuery(SQL, con);
            while (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Album_DAL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Album_DAL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public static ArrayList<Album> Search(String id, String id_user, String name_album) {
        try {
            Connection con = DAL.Connecting();
            String SQL = "SELECT * FROM image_shopping.album WHERE (1=1)";
            if (!id.isEmpty()) {
                SQL = SQL + " AND id = " + id.toString();
            }
            if (!id_user.isEmpty()) {
                SQL = SQL + " AND id_user = " + id_user.toString();
            }
            if (!name_album.isEmpty()) {
                SQL = SQL + " AND name = '" + name_album + "'";
            }
            SQL = SQL + ";";
            ResultSet rs;
            try {
                ArrayList<Album> list = new ArrayList<Album>();
                rs = DAL.ExecuteQuery(SQL, con);
                while (rs.next()) {
                    Album album = new Album();
                    album.setId(rs.getInt("id"));
                    album.setId_user(rs.getInt("id_user"));
                    album.setName(rs.getString("name"));
                    list.add(album);
                }
                con.close();
                return list;
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DAL.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static ArrayList<String> getAllAlbumName(){
        ArrayList<String> listAlbumName = new ArrayList<>();
        try{
            Connection con = Album_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call getAllAlbumName()}");
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while(rs.next()){
                listAlbumName.add(rs.getString("name"));
            }
            return listAlbumName;
        }catch(Exception e){
            return null;
        }
    }
}