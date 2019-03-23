/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.sql.Connection;
import model.Ticket;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
/**
 *
 * @author admin
 */
public class TicketDao {
    private Connection connection;

    public TicketDao(DBContext dbContext) {
        try {
            connection = dbContext.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(TicketDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public float getTicketPricebyMatch(int matchID){
        float price = 0;
        
            try{
            String sql = "select Cost from Ticket where matchID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, matchID);
            
            ResultSet rs = psmt.executeQuery();
            price = rs.getFloat(1);
        }catch(SQLException se){
            
        }
            return price;
    }
    
    public ArrayList<Ticket> getTicketByMatch(int matchID){
        ArrayList<Ticket> ticket = new ArrayList<>();
        
        try{
            String sql = "select * from Ticket where matchID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, matchID);
            
            ResultSet rs = psmt.executeQuery();
            while(rs.next()){
                Ticket t = new Ticket(rs.getInt(1), rs.getInt(2), rs.getFloat(3), matchID);
                ticket.add(t);
            }
        }catch(SQLException se){
            
        }
        
        return ticket;
    }
    public float buyTicket(int matchID,int n){
        
        float totalcost = 0;
        
          ArrayList<Ticket> ticket = new ArrayList<>();
        
        try{
            String sql = "select * from Ticket where matchID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, matchID);
            
            ResultSet rs = psmt.executeQuery();
            while(rs.next()){
                Ticket t = new Ticket(rs.getInt(1), rs.getInt(2), rs.getFloat(3), matchID);
                ticket.add(t);
            }
        }catch(SQLException se){
            
        }
        for(int i = 0;i < n;i++){
            totalcost += ticket.get(i).getCost();
            ticket.remove(i);
        }
        
        try{
            String sql1 = "delete from Ticket where matchID = ?";
             PreparedStatement psmt1 = connection.prepareStatement(sql1);
            psmt1.setInt(1, matchID);
            
            String sql2 = "insert into Ticket value(?,?,?,?)";
            PreparedStatement psmt2 = connection.prepareStatement(sql2);
            for(int i = 0;i < ticket.size();i++){
                psmt2.setInt(1, ticket.get(i).getTicketID());
                psmt2.setInt(2, ticket.get(i).getSeatNumber());
                psmt2.setFloat(3, ticket.get(i).getCost());
                psmt2.setInt(4, ticket.get(i).getMatchID());
            }
        }catch(SQLException se){
            
        }
        
        return totalcost;
        
    }
    
    
    
   
}
