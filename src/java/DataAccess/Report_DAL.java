/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Model.Report;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Razer Duy
 */
public class Report_DAL extends DAL {
    
    public static void getAllReport(){
        ArrayList<Report> list = new ArrayList<>();
        try {
            Connection con = User_DAL.Connecting();
            String SQL = "SELECT * FROM image_shopping.reports;";
            ResultSet rs = DAL.ExecuteQuery(SQL, con);
            while(rs.next()){
                Report rp = new Report();
                rp.setId(rs.getInt("id"));
                rp.setId_user(rs.getInt("id_user"));
                rp.setId_img(rs.getInt("id_img"));
                rp.setContent(rs.getString("content"));
                rp.setAccept(rs.getInt("accept"));
                list.add(rp);
            }
            Report.setListReport(list);
            con.close();
        } catch (Exception e){
            
        }
    }
    
    public static boolean UpdatePermission(int IDreport, int permission){
        try{
            Connection con = Report_DAL.Connecting();
            CallableStatement cs = con.prepareCall("{call permission_report(?, ?)}");
            cs.setInt(1, IDreport);
            cs.setInt(2, permission);
            cs.execute();
            return true;
        }catch(Exception e){
            return false;
        }
    }
    
}
