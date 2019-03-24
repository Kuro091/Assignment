/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
                    prepareStatement("insert into Receipt(UserID,TotalPrice,TotalTicket) values(?,?,?)");
            
            preparedStatement.setInt(1, r.getUserID());
            preparedStatement.setFloat(2, r.getTotalprice());
            
            preparedStatement.setInt(3, r.getTotalticket());
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            
        }
    }
    
   // public ArrayList<Receipt> getReceipt(){
        
   // }
    
}
