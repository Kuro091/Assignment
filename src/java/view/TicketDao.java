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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;
        
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
    
    public void updateTicket(int matchID,int amount){
        try{
            String sql = "update Ticket\n" +
"set isAvailable = 0\n" +
"where TicketID in(select top(?) TicketID \n" +
"					from Ticket\n" +
"					where MatchID = ? and isAvailable = 1\n" +
"					order by TicketID desc)";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, amount);
            psmt.setInt(2, matchID);
            psmt.executeUpdate();
        }catch(SQLException se){
            se.printStackTrace();
        }
    }
    
       public void reupdateTicket(int matchID,int amount){
        try{
            String sql = "update Ticket\n" +
"set isAvailable = 1\n" +
"where TicketID in(select top(?) TicketID \n" +
"					from Ticket\n" +
"					where MatchID = ? and isAvailable = 0\n" +
"					order by TicketID desc)";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, amount);
            psmt.setInt(2, matchID);
            psmt.executeUpdate();
        }catch(SQLException se){
            se.printStackTrace();
        }
    }
    
    public ArrayList<Ticket> getTicketByMatchID(int matchID){
        ArrayList<Ticket> ticket = new ArrayList<>();
         try{
             String sql = "select * from Ticket where matchID = ?";
             PreparedStatement psmt = connection.prepareStatement(sql);
             psmt.setInt(1, matchID);
             ResultSet rs = psmt.executeQuery();
             
             while(rs.next()){
                 Ticket t = new Ticket(rs.getInt(1), rs.getFloat(2), rs.getInt(3), rs.getInt(4));
                 ticket.add(t);
             }
         }catch(SQLException se){
             se.printStackTrace();
         }
         return ticket;
    }
}
