/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author HP EliteBook
 */
public class DAL {

    protected static String url = "jdbc:mysql://localhost/image_shopping"; // Link to database
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    private static final String USER = "root";
    private static final String PASS = "1234";
    
    protected static Connection Connecting() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, USER, PASS);
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }

    private String getAuthor(int idauthor) throws SQLException, ClassNotFoundException {
        Connection con = DAL.Connecting();
        String SQL = "SELECT fullname FROM user WHERE id =" + idauthor + ";";
        ResultSet rs = DAL.ExecuteQuery(SQL, con);
        rs.next();
        return rs.getString(1);
    }
    
    // đã lấy hết danh sách user lên ram
    /*public User UserInfo(String username) throws SQLException, ClassNotFoundException {
        User user;
        try {
            Connection con = DAL.Connecting();
            user = new User();
            // Query to research User by ID
            String SQL = "SELECT * FROM user WHERE username = '" + username + "';";
            ResultSet rs = DAL.ExecuteQuery(SQL, con);
            int ID = rs.getInt(1);
            String fullname = rs.getString(4);
            String email = rs.getString(5);
            String address = rs.getString(6);
            String phone = rs.getString(7);
            user.addInfo(ID, username, fullname, email, address, phone);
            con.close();
            return user;
        }catch(Exception e){
            
        }
        return null;
    }*/

    protected static ResultSet ExecuteQuery(String SQL, Connection con) throws SQLException, ClassNotFoundException {
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(SQL);
        return rs;
    }
}
