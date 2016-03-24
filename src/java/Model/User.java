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
public class User {
    private static ArrayList<User> list_user = new ArrayList<User>();
    
    private int ID;
    private String username;
    //private String password;
    private String fullname;
    private String email;
    private String address;
    private String phone;
    private int active;
    
    public void addInfo(int newID, String newUserName, String newFullName, String newEmail, String newAddress, String newPhone){
        setID(newID);
        setUsername(newUserName);
        setFullname(newFullName);
        setEmail(newEmail);
        setAddress(newAddress);
        setPhone(newPhone);
    }
    
    /**
     * @param aList_user the list_user to set
     */
    public static void setList_user(ArrayList<User> aList_user) {
        list_user = aList_user;
    }
    
    /**
     * @return the list_user
     */
    public static ArrayList<User> getList_user() {
        return list_user;
    }
        public static User getUserbyUsername(String username){
        for(User us: list_user){
            if(us.getUsername().equals(username))
                return us;
        }
        return null;
    }
    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    /*public String getPassword() {
        return password;
    }*/

    /**
     * @param password the password to set
     */
    /*public void setPassword(String password) {
        this.password = password;
    }*/

    /**
     * @return the fullname
     */
    public String getFullname() {
        return fullname;
    }

    /**
     * @param fullname the fullname to set
     */
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the active
     */
    public int getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(int active) {
        this.active = active;
    }

}