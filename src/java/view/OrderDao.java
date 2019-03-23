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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.UserAccount;
/**
 *
 * @author admin
 */
public class OrderDao {
     private Connection connection;

    public OrderDao(DBContext dbContext) {
        try {
            connection = dbContext.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public float countTotalPrice(int amount,float price){
        return amount * price;
        
    }
    
    public void createOrder(Order order){
        try{
            String sql = "insert into Receipt values (?,?,?,?,?)";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, order.getOrderID());
            psmt.setInt(2,order.getUserID());
            psmt.setFloat(3, order.getTotalprice());
            psmt.setInt(4, order.getTotalticket());
            psmt.setInt(5,order.getMatchID());
            psmt.executeUpdate();
        }catch(SQLException se){
            
        }
    }
    
    public void update(){
        
    }
}
