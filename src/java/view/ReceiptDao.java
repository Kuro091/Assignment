/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;
import java.util.ArrayList;
/**
 *
 * @author admin
 */
public class ReceiptDao {
    private Connection connection;

    public ReceiptDao(DBContext dbContext) {
        try {
            connection = dbContext.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(ReceiptDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void createReceipt(Receipt r){
         try {            
            PreparedStatement preparedStatement = connection.
                    prepareStatement("insert into Receipt(UserID,TotalPrice,TotalTicket,Status) values(?,?,?,?)");
            
            preparedStatement.setInt(1, r.getUserID());
            preparedStatement.setFloat(2, r.getTotalprice());
            preparedStatement.setInt(3, r.getTotalticket());
            preparedStatement.setBoolean(4, r.isStatus());
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Receipt getReceiptById(int id){
        Receipt r = null;
        try{
            String sql = "select * from Receipt where ReceiptID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();
            while(rs.next()){
                r = new Receipt(id, rs.getInt(2), rs.getFloat(3), rs.getInt(4), rs.getBoolean(5));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return r;
    }
    
    public void deleteReceiptById(int id){
           try{
            String sql = "delete from Receipt where ReceiptID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, id);
            psmt.executeUpdate();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateReceiptStatus(int id){
          try{
            String sql = "update Receipt set Status = 1 where ReceiptID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, id);
            
            psmt.executeUpdate();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
   // public ArrayList<Receipt> getReceipt(){
        
   // }
    
}
